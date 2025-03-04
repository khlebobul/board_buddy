import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:use_scramble/use_scramble.dart';

class GameEndUnoModalWidget extends StatelessWidget {
  final List<Player> players;
  final String gameMode;
  final int scoreLimit;
  final VoidCallback onNewGameWithSamePlayers;
  final VoidCallback onNewGame;
  final VoidCallback onReturnToMenu;

  const GameEndUnoModalWidget({
    super.key,
    required this.players,
    required this.gameMode,
    required this.scoreLimit,
    required this.onNewGameWithSamePlayers,
    required this.onNewGame,
    required this.onReturnToMenu,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    // Sort players by score based on game mode
    final sortedPlayers = List<Player>.from(players);
    if (gameMode == S.of(context).highestScoreWins) {
      // For highest score wins, sort in descending order (highest first)
      sortedPlayers.sort((a, b) => b.score.compareTo(a.score));
    } else {
      // For lowest score wins, sort in ascending order (lowest first)
      sortedPlayers.sort((a, b) => a.score.compareTo(b.score));
    }

    // Determine the winner (first player after sorting)
    final Player winner = sortedPlayers.first;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: theme.bgColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              S.of(context).gameOver,
              style: theme.display1.copyWith(
                color: theme.redColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              S.of(context).winner + winner.name.toLowerCase(),
              style: theme.display2.copyWith(
                color: theme.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),

          // Player scores list
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: sortedPlayers.map((player) {
                    final isWinner = player.id == winner.id;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            player.name,
                            style: theme.display2.copyWith(
                              color:
                                  isWinner ? theme.redColor : theme.textColor,
                            ),
                          ),
                          Text(
                            player.score.toString(),
                            style: theme.display2.copyWith(
                              color:
                                  isWinner ? theme.redColor : theme.textColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onNewGameWithSamePlayers,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    // TODO: fix after adding alignment to the package
                    child: Center(
                      child: Text(
                        S.of(context).newGameWithSamePlayers,
                        style: theme.display2,
                        // textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onNewGame,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: TextScramble(
                        text: S.of(context).newGame,
                        style: theme.display2,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onReturnToMenu,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: TextScramble(
                        text: S.of(context).returnToMenu,
                        style: theme.display2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  static void show(
    BuildContext context, {
    required List<Player> players,
    required String gameMode,
    required int scoreLimit,
    required VoidCallback onNewGameWithSamePlayers,
    required VoidCallback onNewGame,
    required VoidCallback onReturnToMenu,
  }) {
    HapticFeedback.selectionClick();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return GameEndUnoModalWidget(
          players: players,
          gameMode: gameMode,
          scoreLimit: scoreLimit,
          onNewGameWithSamePlayers: onNewGameWithSamePlayers,
          onNewGame: onNewGame,
          onReturnToMenu: onReturnToMenu,
        );
      },
    );
  }
}
