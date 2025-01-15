

import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/screens/splash_screen.dart';
import 'package:board_buddy/services/language_service.dart';
import 'package:board_buddy/services/theme_service.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ThemeService.initializeTheme();

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
                ],
              );
            }
          },
        );
      },
    );
  }
}
