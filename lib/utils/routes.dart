import 'package:board_buddy/games/common_game.dart';
import 'package:board_buddy/games/dos_game.dart';
import 'package:board_buddy/games/munchkin_game.dart';
import 'package:board_buddy/games/scrabble_game.dart';
import 'package:board_buddy/games/set_game.dart';
import 'package:board_buddy/games/uno_flip_game.dart';
import 'package:board_buddy/games/uno_game.dart';
import 'package:board_buddy/screens/about_screen.dart';
import 'package:board_buddy/screens/games_screen.dart';
import 'package:board_buddy/screens/rules/dos_rules.dart';
import 'package:board_buddy/screens/rules/munchkin_rules.dart';
import 'package:board_buddy/screens/rules/scrabble_rules.dart';
import 'package:board_buddy/screens/rules/set_rules.dart';
import 'package:board_buddy/screens/rules/uno_flip_rules.dart';
import 'package:board_buddy/screens/rules/uno_rules.dart';
import 'package:board_buddy/screens/rules_screen.dart';
import 'package:board_buddy/screens/settings/settings_screen.dart';
import 'package:board_buddy/screens/splash_screen.dart';
import 'package:flutter/material.dart';

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
