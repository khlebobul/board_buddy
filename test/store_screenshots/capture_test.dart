// Real screens, real score events; isolated preferences and temporary SQLite.
import 'dart:io';
import 'dart:ui' as ui;
import 'duo_system_bars.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/common_counter/bloc/common_counter_bloc.dart'
    as common;
import 'package:board_buddy/features/games/common_counter/view/common_game.dart';
import 'package:board_buddy/features/games/uno/bloc/uno_bloc.dart' as uno;
import 'package:board_buddy/features/games/uno/view/uno_game.dart';
import 'package:board_buddy/features/games/uno/view/uno_rules.dart';
import 'package:board_buddy/features/games_list/view/games_screen.dart';
import 'package:board_buddy/features/games/common_counter/view/common_game_start_screen.dart';
import 'package:board_buddy/features/games/catan/bloc/catan_bloc.dart' as catan;
import 'package:board_buddy/features/games/catan/view/catan_game.dart';
import 'package:board_buddy/features/games/catan/widgets/catan_map_generator_dialog.dart';
import 'package:board_buddy/features/games/catan/models/catan_tile.dart';
import 'package:board_buddy/features/games/catan/models/catan_resource.dart';
import 'package:board_buddy/features/games/catan/widgets/hexagon_border_painter.dart';
import 'package:board_buddy/shared/widgets/game_widgets/dice_modal.dart';
import 'package:board_buddy/shared/widgets/game_widgets/timer.dart';
import 'package:not_static_icons/not_static_icons.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/services/language_service.dart';
import 'package:board_buddy/shared/services/database_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

const root = 'store_screenshots/public';
const devices = [
  (
    name: 'apple/iphone-duo-outer',
    size: Size(1398, 2034),
    ratio: 3.0,
    platform: TargetPlatform.iOS
  ),
  (
    name: 'apple/iphone-duo-inner',
    size: Size(2007, 2853),
    ratio: 3.0,
    platform: TargetPlatform.iOS
  ),
  (
    name: 'apple/iphone',
    size: Size(918, 1990),
    ratio: 2.0,
    platform: TargetPlatform.iOS
  ),
  (
    name: 'apple/ipad',
    size: Size(2064, 2752),
    ratio: 2.5,
    platform: TargetPlatform.iOS
  ),
  (
    name: 'android/phone',
    size: Size(1080, 2416),
    ratio: 2.625,
    platform: TargetPlatform.android
  ),
];
final captureKey = GlobalKey();

Future<void> settle(WidgetTester tester) async {
  for (var i = 0; i < 25; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

Future<void> settleRoll(WidgetTester tester) async {
  for (var i = 0; i < 30; i++) {
    await tester.pump(const Duration(milliseconds: 50));
    await tester
        .runAsync(() => Future<void>.delayed(const Duration(milliseconds: 30)));
  }
  await tester.pump(const Duration(seconds: 1));
  await tester.pump();
}

bool validCatanNumbers(List<CatanTile> tiles) {
  final positions = <(double, int)>[];
  for (var row = 0; row < 5; row++) {
    final count = [3, 4, 5, 4, 3][row];
    for (var col = 0; col < count; col++) {
      positions.add((col - (count - 1) / 2, row));
    }
  }
  final reds = [
    for (var i = 0; i < tiles.length; i++)
      if ([6, 8].contains(tiles[i].number)) i
  ];
  for (final a in reds) {
    for (final b in reds.where((b) => b > a)) {
      final dx = (positions[a].$1 - positions[b].$1).abs();
      final dy = (positions[a].$2 - positions[b].$2).abs();
      if ((dy == 0 && dx == 1) || (dy == 1 && dx == .5)) return false;
    }
  }
  return true;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory databaseDir;
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfiNoIsolate;
    databaseDir = Directory.systemTemp.createTempSync('board-buddy-capture-');
    await databaseFactory.setDatabasesPath(databaseDir.path);
    await DatabaseService.database;
    for (final font in [
      ('RobotoMono', 'assets/fonts/roboto_mono.ttf'),
      ('StoreCJK', '$root/fonts/NotoSansCJK.otf'),
      ('StoreHindi', '$root/fonts/NotoSansDevanagari.ttf'),
    ]) {
      final loader = FontLoader(font.$1);
      loader.addFont(
          Future.value(ByteData.sublistView(File(font.$2).readAsBytesSync())));
      await loader.load();
    }
  });
  tearDownAll(() async {
    await (await databaseFactory
            .openDatabase('${databaseDir.path}/board_buddy.db'))
        .close();
    databaseDir.deleteSync(recursive: true);
  });
  for (final locale in LanguageService.supportedLanguageCodes) {
    for (final device in devices) {
      testWidgets(
          '$locale ${device.name}: catalog, scores, undo, modes, dice, timer, resume, rules, maps',
          (tester) async {
        tester.view.physicalSize = device.size;
        tester.view.devicePixelRatio = device.ratio;
        final outer = device.name.endsWith('duo-outer');
        final duo = device.name.contains('duo');
        tester.view.padding = FakeViewPadding(
            top: (outer ? 24 : 48) * device.ratio,
            right: (outer ? 84 : 0) * device.ratio,
            bottom: (duo ? 24 : 28) * device.ratio);
        if (duo) tester.view.viewPadding = tester.view.padding;
        debugDefaultTargetPlatformOverride = device.platform;
        addTearDown(() {
          tester.view.reset();
          debugDefaultTargetPlatformOverride = null;
        });
        Future<void> shoot(String name, Widget screen,
            {bool dark = false, Future<void> Function()? interact}) async {
          await tester.pumpWidget(RepaintBoundary(
            key: captureKey,
            child: MaterialApp(
              key: UniqueKey(),
              debugShowCheckedModeBanner: false,
              locale: Locale(locale),
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              theme: UIThemes.lightTheme().copyWith(
                  platform: device.platform,
                  textTheme: UIThemes.lightTheme()
                      .textTheme
                      .apply(fontFamilyFallback: ['StoreCJK', 'StoreHindi'])),
              darkTheme: UIThemes.darkTheme().copyWith(
                  platform: device.platform,
                  textTheme: UIThemes.darkTheme()
                      .textTheme
                      .apply(fontFamilyFallback: ['StoreCJK', 'StoreHindi'])),
              themeMode: dark ? ThemeMode.dark : ThemeMode.light,
              builder: (context, child) => DefaultTextStyle.merge(
                style: const TextStyle(
                    fontFamilyFallback: ['StoreCJK', 'StoreHindi']),
                child: Stack(children: [
                  child!,
                  if (duo)
                    DuoSystemBars(outer: outer, dark: dark)
                  else
                    Positioned(
                        top: 12,
                        left: 26,
                        child: Material(
                            type: MaterialType.transparency,
                            child: Text('9:41',
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    fontSize: 13,
                                    color:
                                        dark ? Colors.white : Colors.black))))
                ]),
              ),
              home: screen,
            ),
          ));
          await settle(tester);
          if (interact != null) await interact();
          await settle(tester);
          expect(tester.takeException(), isNull,
              reason: '$locale ${device.name} $name');
          final boundary = tester
              .renderObject<RenderRepaintBoundary>(find.byKey(captureKey));
          final bytes = await tester.runAsync(() async {
            final image = await boundary.toImage(pixelRatio: device.ratio);
            final data = await image.toByteData(format: ui.ImageByteFormat.png);
            image.dispose();
            return data!.buffer.asUint8List();
          });
          final file =
              File('$root/screenshots/${device.name}/$locale/$name.png');
          file.parent.createSync(recursive: true);
          file.writeAsBytesSync(bytes!);
          if (name == '11-map-light' || name == '12-map-dark') {
            final hexes = find.byWidgetPredicate((widget) =>
                widget is CustomPaint &&
                widget.painter is HexagonBorderPainter);
            final boxes = [
              for (final element in hexes.evaluate())
                tester.getRect(find.byWidget(element.widget))
            ];
            final bounds =
                boxes.reduce((a, b) => a.expandToInclude(b)).inflate(8);
            final cropped = await tester.runAsync(() async {
              final source = await boundary.toImage(pixelRatio: device.ratio);
              final width = (bounds.width * device.ratio).ceil();
              final height = (bounds.height * device.ratio).ceil();
              final recorder = ui.PictureRecorder();
              Canvas(recorder).drawImageRect(
                  source,
                  Rect.fromLTWH(
                      bounds.left * device.ratio,
                      bounds.top * device.ratio,
                      bounds.width * device.ratio,
                      bounds.height * device.ratio),
                  Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
                  Paint());
              final picture = recorder.endRecording();
              final image = await picture.toImage(width, height);
              picture.dispose();
              source.dispose();
              final data =
                  await image.toByteData(format: ui.ImageByteFormat.png);
              image.dispose();
              return data!.buffer.asUint8List();
            });
            final board = File(
                '$root/screenshots/${device.name}/$locale/${dark ? '14-board-dark' : '13-board-light'}.png');
            board.writeAsBytesSync(cropped!);
          }

          await tester.pumpWidget(const SizedBox());
          await tester.pump();
        }

        List<Player> players() => [
              Player(name: 'Alex', id: 1),
              Player(name: 'Sam', id: 2),
              Player(name: 'Robin', id: 3)
            ];
        await shoot('01-games', const GamesScreen());
        final unoBloc = uno.UnoBloc();
        // Duo decks use the common counter; UNO is only captured for older decks.
        if (!duo)
          await shoot(
              '02-uno',
              BlocProvider.value(
                  value: unoBloc,
                  child: UnoGame(
                      players: players(),
                      scoreLimit: 500,
                      gameMode: S.current.highestScoreWins)),
              interact: () async {
            // Two valid rounds: 18+12+20 and 7+9+20+20+20; below the 500-point limit.
            unoBloc.add(uno.UpdatePlayerScore(50));
            await settle(tester);
            unoBloc.add(uno.ChangeCurrentPlayer(1));
            await settle(tester);
            unoBloc.add(uno.UpdatePlayerScore(76));
            await settle(tester);
            unoBloc.add(uno.ChangeCurrentPlayer(2));
            await settle(tester);
            unoBloc.add(uno.UpdatePlayerScore(24));
            await settle(tester);
            unoBloc.add(uno.ChangeCurrentPlayer(0));
            await settle(tester);
            unoBloc.add(uno.ResetScoreAnimation());
            await tester.pump();
            expect(
                (unoBloc.state as uno.UnoGameState).players.map((p) => p.score),
                [50, 76, 24]);
          });
        unoBloc.close();
        await settle(tester);
        final commonBloc = common.CommonCounterBloc();
        commonBloc.add(common.InitializeGameScreen(
            players: players(), isSinglePlayer: false));
        await tester.pump();
        await shoot(
            '03-counter-dark',
            BlocProvider.value(
                value: commonBloc, child: const CommonGameView()),
            dark: true, interact: () async {
          for (var i = 0; i < 3; i++) {
            commonBloc.add(common.IncreaseScoreBy(i, [42, 35, 28][i]));
            await tester.pump();
          }
          commonBloc.add(common.UndoAction());
          await tester.pump();
          commonBloc.add(common.RedoAction());
          await tester.pump();
          commonBloc.add(common.IncreaseScoreBy(0, 5));
          await tester.pump();
          commonBloc.add(common.UndoAction());
          await tester.pump();
          expect(
              (commonBloc.state as common.CommonCounterGameState).redoHistory,
              isNotEmpty);
          commonBloc.add(common.ResetScoreAnimation());
          await tester.pump();
          expect(
              (commonBloc.state as common.CommonCounterGameState)
                  .players
                  .map((p) => p.score),
              [42, 35, 28]);
        });
        await shoot(
            '05-counter-light',
            BlocProvider.value(
                value: commonBloc, child: const CommonGameView()));
        await shoot(
            '06-dice',
            BlocProvider.value(
                value: commonBloc,
                child: const CommonGameView()), interact: () async {
          await tester.tap(find.byType(BoxIcon));
          // Production rolls use a wall-clock Stopwatch and fake-timer delays.
          await settleRoll(tester);
          expect(find.byType(DiceModal), findsOneWidget);
          final face = tester.widget<DiceFace>(find.byType(DiceFace));
          expect(face.number, inInclusiveRange(1, 6));
        });
        await shoot(
            '07-timer',
            BlocProvider.value(
                value: commonBloc,
                child: const CommonGameView()), interact: () async {
          final timer =
              tester.state<TimerWidgetState>(find.byType(TimerWidget));
          timer.startTimer();
          await tester.pump(const Duration(seconds: 83));
          timer.stopTimer();
          await tester.pump();
          expect(timer.getSeconds(), 83);
        });
        commonBloc.add(common.SaveGameSession());
        await settle(tester);
        // Read back real persisted scores before advertising resume.
        final resumed = common.CommonCounterBloc()..add(common.LoadSavedGame());
        await settle(tester);
        expect(
            (resumed.state as common.CommonCounterGameState)
                .players
                .map((p) => p.score),
            [42, 35, 28]);
        await shoot('08-resumed',
            BlocProvider.value(value: resumed, child: const CommonGameView()));
        resumed.close();
        await settle(tester);
        await shoot('09-saved', const CommonGameStartScreen(),
            interact: () async {
          expect(find.byType(Dialog), findsOneWidget);
        });
        commonBloc.close();
        await settle(tester);
        final catanBloc = catan.CatanBloc();
        await shoot(
            '10-catan',
            BlocProvider.value(
                value: catanBloc,
                child: CatanGame(
                    players: players(),
                    scoreLimit: 10,
                    gameMode: S.current.highestScoreWins)), interact: () async {
          // Two starting settlements + two settlements + a city upgrade = five.
          for (final points in [1, 1, 1, 1, 1]) {
            catanBloc.add(catan.UpdatePlayerScore(points));
            await settle(tester);
          }
          catanBloc.add(catan.ResetScoreAnimation());
          await tester.pump();
          expect(
              (catanBloc.state as catan.CatanGameState).players.first.score, 5);
        });
        for (final dark in [false, true]) {
          await shoot(
              dark ? '12-map-dark' : '11-map-light',
              BlocProvider.value(
                  value: catanBloc,
                  child: CatanGame(
                      players: players(),
                      scoreLimit: 10,
                      gameMode: S.current.highestScoreWins)),
              dark: dark, interact: () async {
            await tester.tap(find.byType(MapPlusIcon));
            await settleRoll(tester);
            final dynamic map =
                tester.state(find.byType(CatanMapGeneratorDialog));
            // Re-roll through the real UI until 6/8 tokens are nonadjacent.
            for (var attempt = 0;
                attempt < 50 &&
                    !validCatanNumbers(map.tiles as List<CatanTile>);
                attempt++) {
              final hex = find
                  .byWidgetPredicate((widget) =>
                      widget is CustomPaint &&
                      widget.painter is HexagonBorderPainter)
                  .first;
              await tester.tap(find
                  .ancestor(of: hex, matching: find.byType(GestureDetector))
                  .first);
              await settleRoll(tester);
            }
            final tiles = map.tiles as List<CatanTile>;
            expect(tiles.length, 19);
            expect(
                tiles.where((t) => t.resource == CatanResource.desert).length,
                1);
            expect(validCatanNumbers(tiles), isTrue);
          });
        }
        catanBloc.close();
        await settle(tester);
        if (!duo) await shoot('04-rules', const UnoRulesScreen());
        debugDefaultTargetPlatformOverride = null;
      });
    }
  }
}
