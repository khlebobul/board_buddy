import 'dart:ui';

import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:use_scramble/use_scramble.dart';

class GameEndCommonCounterModal extends StatelessWidget {
  final List<Player> players;
  final bool isSinglePlayer;
  final VoidCallback onContinue;
  final VoidCallback onNewRound;
  final VoidCallback onNewGame;
  final VoidCallback onReturnToMenu;

  const GameEndCommonCounterModal({
    super.key,
    required this.players,
    required this.isSinglePlayer,
    required this.onContinue,
    required this.onNewRound,
    required this.onNewGame,
    required this.onReturnToMenu,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    // Sort players by score in descending order (highest first)
    final sortedPlayers = List<Player>.from(players);
    sortedPlayers.sort((a, b) => b.score.compareTo(a.score));

    // Determine the leader (first player after sorting)
    final Player leader = sortedPlayers.isNotEmpty
        ? sortedPlayers.first
        : Player(name: '', id: 0);
    final bool hasLeader =
        !isSinglePlayer && sortedPlayers.isNotEmpty && leader.score > 0;

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                S.of(context).results,
                style: theme.display1.copyWith(
                  color: theme.redColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (hasLeader)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: GeneralConst.paddingHorizontal),
                child: Text(
                  '${S.of(context).winner}${leader.name.toLowerCase()}',
                  style: theme.display2.copyWith(
                    color: theme.secondaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            const SizedBox(height: 16),

            // Player scores list - this part is scrollable
            Flexible(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 200),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: GeneralConst.paddingHorizontal),
                    child: isSinglePlayer
                        ? Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Text(
                                sortedPlayers.first.score.toString(),
                                style: theme.display1.copyWith(
                                  color: theme.redColor,
                                ),
                              ),
                            ),
                          )
                        : Column(
                            children: sortedPlayers.map((player) {
                              final isLeader =
                                  hasLeader && player.id == leader.id;
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        player.name.toLowerCase(),
                                        style: theme.display2.copyWith(
                                          color: isLeader
                                              ? theme.redColor
                                              : theme.textColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      player.score.toString(),
                                      style: theme.display2
                                          .copyWith(color: theme.redColor),
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

            // Button section
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: GeneralConst.paddingHorizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onContinue,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextScramble(
                          text: S.of(context).continueTitle,
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
                    onTap: onNewRound,
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
    required bool isSinglePlayer,
    required VoidCallback onContinue,
    required VoidCallback onNewRound,
    required VoidCallback onNewGame,
    required VoidCallback onReturnToMenu,
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
              child: GameEndCommonCounterModal(
                players: players,
                isSinglePlayer: isSinglePlayer,
                onContinue: onContinue,
                onNewRound: onNewRound,
                onNewGame: onNewGame,
                onReturnToMenu: onReturnToMenu,
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
