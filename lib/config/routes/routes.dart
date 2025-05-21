import 'package:board_buddy/features/games/common_counter/view/common_game.dart';
import 'package:board_buddy/features/games/common_counter/view/common_game_start_screen.dart';
import 'package:board_buddy/features/games/dos/view/dos_game.dart';
import 'package:board_buddy/features/games/dos/view/dos_start_screen.dart';
import 'package:board_buddy/features/games/muncknin/view/munchkin_game.dart';
import 'package:board_buddy/features/games/muncknin/view/munchkin_start_screen.dart';
import 'package:board_buddy/features/games/scrabble/view/scrabble_game.dart';
import 'package:board_buddy/features/games/set/bloc/set_bloc.dart';
import 'package:board_buddy/features/games/set/view/set_game.dart';
import 'package:board_buddy/features/games/set/view/set_start_screen.dart';
import 'package:board_buddy/features/games/uno/view/uno_start_screen.dart';
import 'package:board_buddy/features/games/uno_flip/bloc/uno_flip_bloc.dart';
import 'package:board_buddy/features/games/uno_flip/view/uno_flip_game.dart';
import 'package:board_buddy/features/games/uno/view/uno_game.dart';
import 'package:board_buddy/features/about/view/about_screen.dart';
import 'package:board_buddy/features/games/uno_flip/view/uno_flip_start_screen.dart';
import 'package:board_buddy/features/games_list/view/games_screen.dart';
import 'package:board_buddy/features/games/dos/view/dos_rules.dart';
import 'package:board_buddy/features/games/muncknin/view/munchkin_rules.dart';
import 'package:board_buddy/features/games/scrabble/view/scrabble_rules.dart';
import 'package:board_buddy/features/games/set/view/set_rules.dart';
import 'package:board_buddy/features/games/uno_flip/view/uno_flip_rules.dart';
import 'package:board_buddy/features/games/uno/view/uno_rules.dart';
import 'package:board_buddy/features/home/view/home_screen.dart';
import 'package:board_buddy/features/rules_games_list/view/rules_screen.dart';
import 'package:board_buddy/features/settings/settings_screen.dart';
import 'package:board_buddy/features/splash/view/splash_screen.dart';
import 'package:board_buddy/features/games/uno/bloc/uno_bloc.dart';
import 'package:board_buddy/features/games/dos/bloc/dos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:board_buddy/features/games/scrabble/view/scrabble_start_screen.dart';

class AppRoutes {
  // main routes
  static const String about = '/about';
  static const String games = '/games';
  static const String rules = '/rules';
  static const String settings = '/settings';
  static const String splash = '/';
  static const String home = '/home';

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
  static const String unoFlipStartGame = '/unoFlipStartGame';
  static const String dosGame = '/dosGame';
  static const String dosStartGame = '/dosStartGame';
  static const String setGame = '/setGame';
  static const String setStartGame = '/setStartGame';
  static const String munchkinGame = '/munchkinGame';
  static const String munchkinStartGame = '/munchkinStartGame';
  static const String commonGame = '/commonGame';
  static const String commonGameStartScreen = '/commonStartGame';
  static const String scrabbleStartGame = '/scrabbleStartGame';

  static Map<String, WidgetBuilder> get routes => {
        // main
        about: (context) => const AboutScreen(),
        games: (context) => const GamesScreen(),
        rules: (context) => const RulesScreen(),
        settings: (context) => const SettingsScreen(),
        home: (context) => const HomeScreen(),

        // rules
        unoRules: (context) => const UnoRulesScreen(),
        scrabbleRules: (context) => const ScrabbleRulesScreen(),
        unoFlipRules: (context) => const UnoFlipRulesScreen(),
        dosRules: (context) => const DosRulesScreen(),
        setRules: (context) => const SetRulesScreen(),
        munchkinRules: (context) => const MunchkinRulesScreen(),

        // games
        unoStartGame: (context) => const UnoStartScreen(),
        dosStartGame: (context) => const DosStartScreen(),
        scrabbleGame: (context) => const ScrabbleGame(),
        scrabbleStartGame: (context) => const ScrabbleStartScreen(),
        unoFlipStartGame: (context) => const UnoFlipStartScreen(),
        setStartGame: (context) => const SetGameStartScreen(),
        munchkinStartGame: (context) => const MunchkinStartScreen(),
        munchkinGame: (context) => const MunchkinGameWrapper(),
        commonGameStartScreen: (context) => const CommonGameStartScreen(),
      };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // uno game
    if (settings.name == unoGame) {
      if (settings.arguments != null) {
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => UnoBloc(),
            child: UnoGame(
              players: args['players'],
              scoreLimit: args['scoreLimit'],
              gameMode: args['gameMode'],
            ),
          ),
        );
      } else {
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => UnoBloc(),
            child: UnoGame(
              players: const [],
              scoreLimit: 500,
              gameMode: '',
            ),
          ),
        );
      }
    }

    // dos game
    if (settings.name == dosGame) {
      if (settings.arguments != null) {
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DosBloc(),
            child: DosGame(
              players: args['players'],
              scoreLimit: args['scoreLimit'],
              gameMode: args['gameMode'],
            ),
          ),
        );
      } else {
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DosBloc(),
            child: DosGame(
              players: const [],
              scoreLimit: 200,
              gameMode: '',
            ),
          ),
        );
      }
    }

    // uno flip game
    if (settings.name == unoFlipGame) {
      if (settings.arguments != null) {
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => UnoFlipBloc(),
            child: UnoFlipGame(
              players: args['players'],
              scoreLimit: args['scoreLimit'],
              gameMode: args['gameMode'],
            ),
          ),
        );
      } else {
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => UnoFlipBloc(),
            child: UnoFlipGame(
              players: const [],
              scoreLimit: 500,
              gameMode: '',
            ),
          ),
        );
      }
    }

    // common counter game
    if (settings.name == commonGame) {
      if (settings.arguments != null) {
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => CommonGame(
            players: args['players'],
            isSinglePlayer: args['isSinglePlayer'],
          ),
        );
      } else {
        return MaterialPageRoute(
          builder: (context) => const CommonGame(),
        );
      }
    }

    // set counter bloc
    if (settings.name == setGame) {
      if (settings.arguments != null) {
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SetBloc(),
            child: SetGame(
              players: args['players'],
              isSinglePlayer: args['isSinglePlayer'],
            ),
          ),
        );
      } else {
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SetBloc(),
            child: const SetGame(),
          ),
        );
      }
    }

    // munchkin game
    if (settings.name == munchkinGame && settings.arguments != null) {
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => MunchkinGameWrapper(
          players: args['players'],
          isSinglePlayer: args['isSinglePlayer'],
        ),
      );
    }

    // scrabble game
    if (settings.name == '/scrabbleGame') {
      if (settings.arguments != null) {
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => ScrabbleGame(
            players: args['players'],
          ),
        );
      } else {
        return MaterialPageRoute(
          builder: (context) => const ScrabbleGame(),
        );
      }
    }

    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder);
    }

    return null;
  }

  static Widget get initialRoute => const SplashScreen();
}
