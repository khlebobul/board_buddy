import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/features/splash/view/splash_screen.dart';
import 'package:board_buddy/shared/services/language_service.dart';
import 'package:board_buddy/shared/services/logger_service.dart';
import 'package:board_buddy/shared/services/preferences_service.dart';
import 'package:board_buddy/shared/services/theme_service.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

final talker = TalkerFlutter.init(
  settings: TalkerSettings(
    enabled: true,
    colors: {
      'error': AnsiPen()..red(),
      'info': AnsiPen()..magenta(),
      'debug': AnsiPen()..green(),
      'bloc-event': AnsiPen()..yellow(),
      'bloc-transition': AnsiPen()..blue(),
      'bloc-create': AnsiPen()..cyan(),
      'bloc-close': AnsiPen()..red(bold: true),
      'success': AnsiPen()..green(),
    },
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LoggerService.initialize(talker);

  debugPrint = (String? message, {int? wrapWidth}) {
    if (message != null) {
      talker.debug(message);
    }
  };

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printEventFullData: true,
      printStateFullData: true,
      printChanges: true,
      printCreations: true,
      printClosings: true,
    ),
  );

  await ThemeService.initializeTheme();

  final keepScreenOn = await PreferencesService.getKeepScreenOn();
  await WakelockPlus.toggle(enable: keepScreenOn);

  FlutterError.onError = (details) {
    talker.handle(details.exception, details.stack);
  };

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeService.themeNotifier,
      builder: (context, themeMode, child) {
        return FutureBuilder(
          future: LanguageService.getInitialLanguage(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox.shrink();
            } else {
              return MaterialApp(
                routes: AppRoutes.routes,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                debugShowCheckedModeBanner: false,
                theme: UIThemes.lightTheme(),
                darkTheme: UIThemes.darkTheme(),
                themeMode: themeMode,
                home: const SplashScreen(),
                locale: Locale(snapshot.data ?? 'en'),
                navigatorObservers: [
                  TalkerRouteObserver(talker),
                ],
                builder: (context, child) {
                  return TalkerWrapper(
                    talker: talker,
                    child: child!,
                  );
                },
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('ru', ''),
                  Locale('de', ''),
                  Locale('fr', ''),
                  Locale('es', ''),
                ],
              );
            }
          },
        );
      },
    );
  }
}
