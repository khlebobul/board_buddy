import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/features/games/scrabble/widgets/scrabble_word_input_widget.dart';
import 'package:board_buddy/features/games/scrabble/widgets/info_scrabble_dialog_widget.dart';
import 'package:board_buddy/features/games/common_counter/widgets/game_end_common_counter_modal.dart';
import 'package:flutter/material.dart';

/// scrabble game screen
class ScrabbleGame extends StatefulWidget {
  final List<Player>? players;

  const ScrabbleGame({
    super.key,
    this.players,
  });

  @override
  State<ScrabbleGame> createState() => _ScrabbleGameState();
}

class _ScrabbleGameState extends State<ScrabbleGame> {
  // Create a key to access the ScrabbleWordInputWidget
  final GlobalKey<ScrabbleWordInputWidgetState> wordInputKey =
      GlobalKey<ScrabbleWordInputWidgetState>();

  @override
  Widget build(BuildContext context) {
    // Get players from arguments if not provided directly
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final gamePlayers = widget.players ?? args?['players'] as List<Player>?;

    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).menu,
        onLeftButtonPressed: () => Navigator.pushNamed(context, '/home'),
        isRules: true,
        rightButtonText: S.of(context).rules,
        onRightButtonPressed: () =>
            Navigator.pushNamed(context, '/scrabbleRules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ScrabbleWordInputWidget(
          key: wordInputKey,
          players: gamePlayers,
        ),
      ),
      bottomNavigationBar: BottomGameBar(
        dialogWidget: const InfoscrabbleDialog(),
        isArrow: true,
        rightButtonText: S.of(context).finish,
        onRightBtnTap: () {
          // Show game completion dialog
          _showGameEndModal(context, gamePlayers);
        },
      ),
    );
  }

  void _showGameEndModal(BuildContext context, List<Player>? players) {
    if (players == null || players.isEmpty) return;

    // Get the move history from the ScrabbleWordInputWidget
    final moveHistory = wordInputKey.currentState?.moveHistory;

    // Calculate scores for each player based on move history
    if (moveHistory != null && moveHistory.isNotEmpty) {
      // Reset all player scores first
      for (var player in players) {
        player.score = 0;
      }

      // Calculate total score for each player
      for (var move in moveHistory) {
        final player = move['player'] as Player;
        final score = move['score'] as int;

        // Find the player in the players list and update their score
        final playerIndex = players.indexWhere((p) => p.id == player.id);
        if (playerIndex != -1) {
          players[playerIndex].score += score;
        }
      }
    }

    // Determine if it's a single player game
    final bool isSinglePlayer = players.length == 1;

    GameEndCommonCounterModal.show(
      context,
      players: players,
      isSinglePlayer: isSinglePlayer,
      onContinue: () {
        Navigator.of(context).pop(); // Close the modal
      },
      onNewRound: () {
        Navigator.of(context).pop(); // Close the modal
        // Reset scores but keep the same players
        setState(() {
          for (var player in players) {
            player.score = 0;
          }
        });
        // Reset the word input widget
        wordInputKey.currentState?.resetGame();
      },
      onNewGame: () {
        Navigator.of(context).pop(); // Close the modal
        Navigator.of(context).pop(); // Return to start screen
        Navigator.pushNamed(context, '/ScrabbleStartGame');
      },
      onReturnToMenu: () {
        Navigator.pushNamed(context, '/home');
      },
    );
  }
}
