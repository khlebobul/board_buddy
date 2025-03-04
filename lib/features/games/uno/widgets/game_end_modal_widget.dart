import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:use_scramble/use_scramble.dart';

class GameEndModalWidget extends StatelessWidget {
  final List<Player> players;
  final String gameMode;
  final int scoreLimit;
  final VoidCallback onNewGameWithSamePlayers;
  final VoidCallback onNewGame;
  final VoidCallback onReturnToMenu;

  const GameEndModalWidget({
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

    // Sort players by score (descending)
    final sortedPlayers = List<Player>.from(players);
    sortedPlayers.sort((a, b) => b.score.compareTo(a.score));

    // Determine the winner
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
              "Game Over",
              style: theme.display1.copyWith(
                color: theme.redColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Winner: ${winner.name}",
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
                          Row(
                            children: [
                              if (isWinner)
                                Icon(
                                  Icons.emoji_events,
                                  color: theme.redColor,
                                  size: 20,
                                ),
                              const SizedBox(width: 8),
                              Text(
                                player.name,
                                style: theme.display2.copyWith(
                                  color: isWinner
                                      ? theme.redColor
                                      : theme.textColor,
                                ),
                              ),
                            ],
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

          // Action buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: onNewGameWithSamePlayers,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextScramble(
                      text: "New game with same players",
                      style: theme.display2.copyWith(color: theme.redColor),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onNewGame,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextScramble(
                      text: "New game",
                      style: theme.display2.copyWith(color: theme.redColor),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onReturnToMenu,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextScramble(
                      text: "Return to menu",
                      style: theme.display2.copyWith(color: theme.redColor),
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
        return GameEndModalWidget(
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
