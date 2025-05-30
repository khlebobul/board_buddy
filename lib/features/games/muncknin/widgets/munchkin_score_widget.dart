import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// widget that represents a score widget for a Munchkin player.
class MunchkinScoreWidget extends StatelessWidget {
  /// The name of the player.
  final String playerName;

  /// The total score of the player.
  final int totalScore;

  /// The gear score of the player.
  final int gearScore;

  /// The level of the player.
  final int level;

  /// The temporary modifier value (from one-time use cards)
  final int temporaryModifier;

  /// Callback function to increase the score.
  final void Function(int index) onIncrease;

  /// Callback function to decrease the score.
  final void Function(int index) onDecrease;

  /// Flag to determine if the widget is for a single player.
  final bool isSinglePlayer;

  const MunchkinScoreWidget({
    required this.onDecrease,
    required this.onIncrease,
    required this.playerName,
    required this.totalScore,
    required this.gearScore,
    required this.level,
    this.temporaryModifier = 0,
    this.isSinglePlayer = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate total strength including temporary modifiers
    final totalStrength = totalScore + temporaryModifier;

    return Container(
      width: isSinglePlayer ? screenWidth : screenWidth * 0.8,
      constraints: BoxConstraints(
        maxHeight: isSinglePlayer ? double.infinity : 320,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: theme.borderColor, width: 1),
        borderRadius: BorderRadius.circular(20),
        color: theme.fgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isSinglePlayer) ...[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                playerName.toLowerCase(),
                style: theme.display2.copyWith(
                  color: theme.secondaryTextColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Divider(
              color: theme.borderColor,
              height: 1,
            ),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ScoreRowWidget(
              title: S.of(context).gear,
              score: gearScore,
              onIncrease: () => onIncrease(0),
              onDecrease: () => onDecrease(0),
            ),
          ),
          Divider(
            color: theme.borderColor,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ScoreRowWidget(
              title: S.of(context).level,
              score: level,
              onIncrease: () => onIncrease(1),
              onDecrease: () => onDecrease(1),
            ),
          ),
          // Show temporary modifier if it's not zero
          if (temporaryModifier != 0) ...[
            Divider(
              color: theme.borderColor,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).modifiers,
                    style: theme.display2.copyWith(
                      color: theme.textColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    temporaryModifier > 0
                        ? '+$temporaryModifier'
                        : temporaryModifier.toString(),
                    style: theme.display2.copyWith(
                      color: temporaryModifier > 0
                          ? theme.textColor
                          : theme.redColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
          Divider(
            color: theme.borderColor,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).totalStrength,
                  style: theme.display2.copyWith(
                    color: theme.textColor,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  totalStrength.toString(),
                  style: theme.display2.copyWith(
                    color: theme.redColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// widget that represents a row for a score component.
class ScoreRowWidget extends StatelessWidget {
  /// The title of the score component.
  final String title;

  /// The score value.
  final int score;

  /// Callback function to increase the score.
  final void Function() onIncrease;

  /// Callback function to decrease the score.
  final void Function() onDecrease;

  const ScoreRowWidget({
    required this.title,
    required this.score,
    required this.onIncrease,
    required this.onDecrease,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onDecrease,
          child: Text(
            '-',
            style: theme.display9.copyWith(color: theme.redColor),
          ),
        ),
        Column(
          children: [
            Text(
              title,
              style: theme.display2.copyWith(
                color: theme.textColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              score.toString(),
              style: theme.display2.copyWith(
                color: theme.textColor,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onIncrease,
          child: Text(
            '+',
            style: theme.display9.copyWith(color: theme.redColor),
          ),
        ),
      ],
    );
  }
}
