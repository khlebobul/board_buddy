import 'library.dart';

class AppRoutes {
  // screens
  static const String about = '/about';
  static const String games = '/games';
  static const String rules = '/rules';
  static const String settings = '/settings';
  static const String splash = '/';

  // rules
  static const String unoRules = '/unoRules';
  static const String scrabbleRules = '/scrabbleRules';
  static const String unoFlipRules = '/unoFlipRules';
  static const String dosRules = '/dosRules';
  static const String setRules = '/setRules';
  static const String munchkinRules = '/munchkinRules';

  // games
  static const String unoGame = '/unoGame';
  static const String scrabbleGame = '/scrabbleGame';
  static const String unoFlipGame = '/unoFlipGame';
  static const String dosGame = '/dosGame';
  static const String setGame = '/setGame';
  static const String munchkinGame = '/munchkinGame';
  static const String commonGame = '/commonGame';

  static Map<String, WidgetBuilder> get routes => {
        about: (context) => const AboutScreen(),
        games: (context) => const GamesScreen(),
        rules: (context) => const RulesScreen(),
        settings: (context) => const SettingsScreen(),

        // rules
        unoRules: (context) => const UnoRulesScreen(),
        scrabbleRules: (context) => const ScrabbleRulesScreen(),
        unoFlipRules: (context) => const UnoFlipRulesScreen(),
        dosRules: (context) => const DosRulesScreen(),
        setRules: (context) => const SetRulesScreen(),
        munchkinRules: (context) => const MunchkinRulesScreen(),

        // games
        unoGame: (context) => const UnoGame(),
        scrabbleGame: (context) => const ScrabbleGame(),
        unoFlipGame: (context) => const UnoFlipGame(),
        dosGame: (context) => const DosGame(),
        setGame: (context) => const SetGame(),
        munchkinGame: (context) => const MunchkinGame(),
        commonGame: (context) => const CommonGame(),
      };

  static Widget get initialRoute => const SplashScreen();
}
