import '../library.dart';

class LanguageService {
  static void changeLanguage(BuildContext context, String languageCode) {
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
