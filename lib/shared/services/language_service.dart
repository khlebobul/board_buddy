import 'dart:ui';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/features/splash/view/splash_screen.dart';
import 'package:board_buddy/shared/services/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const String _languageCodeKey = 'language_code';
  static const List<String> supportedLanguageCodes = [
    'en',
    'ru',
    'de',
    'fr',
    'es',
    'it',
    'zh',
  ];

  static Future<String> getInitialLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? savedLanguage = prefs.getString(_languageCodeKey);
    if (savedLanguage != null) {
      return savedLanguage;
    }

    final String deviceLanguage =
        PlatformDispatcher.instance.locale.languageCode.toLowerCase();

    final String initialLanguage =
        supportedLanguageCodes.contains(deviceLanguage) ? deviceLanguage : 'en';

    await prefs.setString(_languageCodeKey, initialLanguage);

    return initialLanguage;
  }

  static void changeLanguage(BuildContext context, String languageCode) {
    if (!supportedLanguageCodes.contains(languageCode)) {
      throw ArgumentError('Unsupported language code: $languageCode');
    }

    Locale newLocale = Locale(languageCode);
    PreferencesService.setLanguageCode(languageCode).then((_) {
      S.load(newLocale).then((_) {
        Navigator.pushAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                const SplashScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
          (Route<dynamic> route) => false,
        );
      });
    });
  }
}
