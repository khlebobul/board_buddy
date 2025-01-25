import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MunchkinScoreWidget extends StatelessWidget {
  final String playerName;
  final int totalScore;
  final int gearScore;
  final int level;
  final void Function(int index) onIncrease;
  final void Function(int index) onDecrease;
  final bool isSinglePlayer;

  const MunchkinScoreWidget({
    required this.onDecrease,
    required this.onIncrease,
    required this.playerName,
    required this.totalScore,
    required this.gearScore,
    required this.level,
    this.isSinglePlayer = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: isSinglePlayer ? screenWidth : screenWidth * 0.8,
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
              padding: const EdgeInsets.all(12.0),
              child: Text(
                playerName,
                style: theme.display2.copyWith(
                  color: theme.textColor,
                ),
              ),
            ),
            Divider(
              color: theme.borderColor,
              height: 1,
            ),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ScoreRowWidget(
              title: S.of(context).level,
              score: level,
              onIncrease: () => onIncrease(1),
              onDecrease: () => onDecrease(1),
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreRowWidget extends StatelessWidget {
  final String title;
  final int score;
  final void Function() onIncrease;
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
            style: theme.display1.copyWith(color: theme.redColor),
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
            style: theme.display1.copyWith(color: theme.redColor),
          ),
        ),
      ],
    );
  }
}
