import 'dart:ui';

import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/thousand/models/thousand_models.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:use_scramble/use_scramble.dart';

class GameEndThousandModalWidget extends StatelessWidget {
  final List<Player> players;
  final Map<int, ThousandPlayerData> playerData;
  final int? winnerIndex;
  final VoidCallback onNewGameWithSamePlayers;
  final VoidCallback onNewGame;
  final VoidCallback onReturnToMenu;
  final VoidCallback? onContinueGame;

  const GameEndThousandModalWidget({
    super.key,
    required this.players,
    required this.playerData,
    this.winnerIndex,
    required this.onNewGameWithSamePlayers,
    required this.onNewGame,
    required this.onReturnToMenu,
    this.onContinueGame,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    final sortedPlayerEntries = <MapEntry<int, int>>[];
    for (int i = 0; i < players.length; i++) {
      final score = playerData[i]?.totalScore ?? 0;
      sortedPlayerEntries.add(MapEntry(i, score));
    }

    sortedPlayerEntries.sort((a, b) => b.value.compareTo(a.value));

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: theme.bgColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Container(
        width: double.maxFinite,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (winnerIndex != null)
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
            if (winnerIndex != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: GeneralConst.paddingHorizontal),
                child: Text(
                  '${S.of(context).winner}${players[winnerIndex!].name.toLowerCase()}',
                  style: theme.display2.copyWith(
                    color: theme.secondaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            const SizedBox(height: 16),
            Flexible(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: GeneralConst.paddingHorizontal),
                    child: Column(
                      children: sortedPlayerEntries.map((entry) {
                        final playerIndex = entry.key;
                        final player = players[playerIndex];
                        final score = entry.value;
                        final isWinner = playerIndex == winnerIndex;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  player.name.toLowerCase(),
                                  style: theme.display2.copyWith(
                                    color: isWinner
                                        ? theme.redColor
                                        : theme.textColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                score.toString(),
                                style: theme.display2.copyWith(
                                  color: isWinner
                                      ? theme.redColor
                                      : theme.textColor,
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
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: GeneralConst.paddingHorizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (onContinueGame != null)
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: onContinueGame,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextScramble(
                            text: S.of(context).continueGame,
                            builder: (context, scrambledText) {
                              return Text(
                                scrambledText,
                                style: theme.display2.copyWith(
                                  color: theme.redColor,
                                ),
                                textAlign: TextAlign.center,
                              );
                            }),
                      ),
                    ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onNewGameWithSamePlayers,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextScramble(
                          text: S.of(context).newGameWithSamePlayers,
                          builder: (context, scrambledText) {
                            return Text(
                              scrambledText,
                              style: theme.display2,
                              textAlign: TextAlign.center,
                            );
                          }),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onNewGame,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextScramble(
                          text: S.of(context).newGame,
                          builder: (context, scrambledText) {
                            return Text(
                              scrambledText,
                              style: theme.display2,
                              textAlign: TextAlign.center,
                            );
                          }),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onReturnToMenu,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextScramble(
                          text: S.of(context).returnToMenu,
                          builder: (context, scrambledText) {
                            return Text(
                              scrambledText,
                              style: theme.display2,
                              textAlign: TextAlign.center,
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  static void show(
    BuildContext context, {
    required List<Player> players,
    required Map<int, ThousandPlayerData> playerData,
    int? winnerIndex,
    required VoidCallback onNewGameWithSamePlayers,
    required VoidCallback onNewGame,
    required VoidCallback onReturnToMenu,
    VoidCallback? onContinueGame,
  }) {
    HapticFeedback.selectionClick();

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.2),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                color: Colors.black.withValues(alpha: 0),
              ),
            ),
            Center(
              child: GameEndThousandModalWidget(
                players: players,
                playerData: playerData,
                winnerIndex: winnerIndex,
                onNewGameWithSamePlayers: onNewGameWithSamePlayers,
                onNewGame: onNewGame,
                onReturnToMenu: onReturnToMenu,
                onContinueGame: onContinueGame,
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1,
          child: child,
        );
      },
    );
  }
}
