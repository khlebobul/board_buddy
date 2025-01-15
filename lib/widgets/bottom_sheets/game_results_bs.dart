import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/models/player_model.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class GameResultsBottomSheet extends StatelessWidget {
  const GameResultsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final List<Player> players = [
      Player(name: 'player 1', id: 01),
      Player(name: 'player 2', id: 02),
    ];

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.bgColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).results,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: TextScramble(
                    text: S.of(context).close,
                    style: theme.display2.copyWith(color: theme.redColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...players.map((player) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        player.name,
                        style: theme.display2,
                      ),
                      Text(
                        player.score.toString(),
                        style: theme.display2,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
