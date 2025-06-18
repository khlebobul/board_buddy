import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/features/splash/view/splash_screen.dart';
import 'package:board_buddy/shared/services/language_service.dart';
import 'package:board_buddy/shared/services/preferences_service.dart';
import 'package:board_buddy/shared/services/theme_service.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ThemeService.initializeTheme();

  // Initialize wakelock state based on user preference
  final keepScreenOn = await PreferencesService.getKeepScreenOn();
  await WakelockPlus.toggle(enable: keepScreenOn);

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
              return Container();
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
                ],
              );
            }
          },
        );
      },
    );
  }
}
