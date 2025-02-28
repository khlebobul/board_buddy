import 'package:board_buddy/features/games/common_counter/view/common_game.dart';
import 'package:board_buddy/features/games/dos/view/dos_game.dart';
import 'package:board_buddy/features/games/muncknin/view/munchkin_game.dart';
import 'package:board_buddy/features/games/scrabble/view/scrabble_game.dart';
import 'package:board_buddy/features/games/set/view/set_game.dart';
import 'package:board_buddy/features/games/uno/view/uno_start_screen.dart';
import 'package:board_buddy/features/games/uno_flip/view/uno_flip_game.dart';
import 'package:board_buddy/features/games/uno/view/uno_game.dart';
import 'package:board_buddy/features/about/view/about_screen.dart';
import 'package:board_buddy/features/games_list/view/games_screen.dart';
import 'package:board_buddy/features/games/dos/view/dos_rules.dart';
import 'package:board_buddy/features/games/muncknin/view/munchkin_rules.dart';
import 'package:board_buddy/features/games/scrabble/view/scrabble_rules.dart';
import 'package:board_buddy/features/games/set/view/set_rules.dart';
import 'package:board_buddy/features/games/uno_flip/view/uno_flip_rules.dart';
import 'package:board_buddy/features/games/uno/view/uno_rules.dart';
import 'package:board_buddy/features/rules_games_list/view/rules_screen.dart';
import 'package:board_buddy/features/settings/settings_screen.dart';
import 'package:board_buddy/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // main routes
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
  static const String unoStartGame = '/unoStartGame';
  static const String scrabbleGame = '/scrabbleGame';
  static const String unoFlipGame = '/unoFlipGame';
  static const String dosGame = '/dosGame';
  static const String setGame = '/setGame';
  static const String munchkinGame = '/munchkinGame';
  static const String commonGame = '/commonGame';

  static Map<String, WidgetBuilder> get routes => {
        // main
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
        unoStartGame: (context) => const UnoStartScreen(),
        scrabbleGame: (context) => const ScrabbleGame(),
        unoFlipGame: (context) => const UnoFlipGame(),
        dosGame: (context) => const DosGame(),
        setGame: (context) => const SetGame(),
        munchkinGame: (context) => const MunchkinGame(),
        commonGame: (context) => const CommonGame(),
      };

  static Widget get initialRoute => const SplashScreen();
}
