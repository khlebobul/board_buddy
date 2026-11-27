import 'package:cupertino_ui/cupertino_ui.dart' as cupertino_ui;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart' as material_ui;
// ignore: depend_on_referenced_packages
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
// ignore: depend_on_referenced_packages
import 'package:version/version.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('material upgrade dialog builds with standalone localizations',
      (tester) async {
    await _pumpAlert(tester, UpgradeDialogStyle.material);
    expect(find.byKey(const Key('upgrader.dialog.title')), findsOneWidget);
    expect(find.text('UPDATE NOW'), findsOneWidget);
  });

  testWidgets('cupertino upgrade dialog builds with standalone localizations',
      (tester) async {
    await _pumpAlert(tester, UpgradeDialogStyle.cupertino);
    expect(find.byKey(const Key('upgrader.dialog.title')), findsOneWidget);
    expect(find.text('UPDATE NOW'), findsOneWidget);
  });
}

Future<void> _pumpAlert(WidgetTester tester, UpgradeDialogStyle style) async {
  SharedPreferences.setMockInitialValues({});
  final upgrader = Upgrader(
    debugDisplayAlways: true,
    checkOnResume: false,
    storeController: UpgraderStoreController(
      onAndroid: _FakeStore.new,
      oniOS: _FakeStore.new,
      onLinux: _FakeStore.new,
      onMacOS: _FakeStore.new,
      onWindows: _FakeStore.new,
      onWeb: _FakeStore.new,
    ),
  );
  addTearDown(upgrader.dispose);
  upgrader.installPackageInfo(
    packageInfo: PackageInfo(
      appName: 'Board Buddy',
      packageName: 'com.example.board_buddy',
      version: '1.0.0',
      buildNumber: '1',
    ),
  );

  await tester.pumpWidget(
    MaterialApp(
      locale: const Locale('en'),
      supportedLocales: const [Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        material_ui.GlobalMaterialLocalizations.delegate,
        cupertino_ui.GlobalCupertinoLocalizations.delegate,
      ],
      home: material_ui.Theme(
        data: material_ui.ThemeData(
          useMaterial3: true,
          fontFamily: 'RobotoMono',
          colorScheme: const material_ui.ColorScheme.light(
            primary: Color(0xff202020),
            onPrimary: Color(0xffF1F1F1),
            surface: Color(0xffF1F1F1),
            onSurface: Color(0xff202020),
          ),
        ),
        child: UpgradeAlert(
          dialogStyle: style,
          upgrader: upgrader,
          child: const SizedBox.shrink(),
        ),
      ),
    ),
  );

  await tester.pump(const Duration(milliseconds: 1));
  await tester.pump(const Duration(milliseconds: 1));
  await tester.pump(const Duration(milliseconds: 1));
  await tester.pump(const Duration(milliseconds: 1));
}

class _FakeStore extends UpgraderStore {
  @override
  Future<UpgraderVersionInfo> getVersionInfo({
    required UpgraderState state,
    required Version installedVersion,
    required String? country,
    required String? language,
  }) async {
    return UpgraderVersionInfo(
      installedVersion: installedVersion,
      appStoreVersion: Version(9, 0, 0),
      appStoreListingURL: 'https://example.com',
    );
  }
}
