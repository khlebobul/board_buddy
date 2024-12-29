import 'library.dart';

class AppRoutes {
  static const String about = '/about';
  static const String games = '/games';
  static const String rules = '/rules';
  static const String settings = '/settings';
  static const String splash = '/';

  static Map<String, WidgetBuilder> get routes => {
        about: (context) => const AboutScreen(),
        games: (context) => const GamesScreen(),
        rules: (context) => const RulesScreen(),
        settings: (context) => const SettingsScreen(),
      };

  static Widget get initialRoute => const SplashScreen();
}
