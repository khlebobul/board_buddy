import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/utils/useful_methods.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';

/// widget that represents a score widget for multiple players.
class PlayersScoreWidget extends StatelessWidget {
  /// List of players whose scores are displayed.
  final List<Player> players;

  /// Callback function to increase the score of a player.
  final void Function(int index) onIncrease;

  /// Callback function to decrease the score of a player.
  final void Function(int index) onDecrease;

  const PlayersScoreWidget({
    required this.players,
    required this.onIncrease,
    required this.onDecrease,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    if (players.length == 1) {
      return Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: theme.borderColor, width: 1),
          borderRadius: BorderRadius.circular(20),
          color: theme.fgColor,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '-',
                      style: theme.display9.copyWith(color: theme.redColor),
                    ),
                    Text(
                      players[0].score.toString(),
                      style: theme.display2.copyWith(
                        color: players[0].score < 0
                            ? theme.redColor
                            : theme.textColor,
                      ),
                    ),
                    Text(
                      '+',
                      style: theme.display9.copyWith(color: theme.redColor),
                    ),
                  ],
                ),
              ),
              // Left half for decrease
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: constraints.maxWidth / 2,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    onDecrease(0);
                    Gaimon.soft();
                  },
                  child: const SizedBox.shrink(),
                ),
              ),
              // Right half for increase
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                width: constraints.maxWidth / 2,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    onIncrease(0);
                    Gaimon.soft();
                  },
                  child: const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: theme.borderColor, width: 1),
        borderRadius: BorderRadius.circular(20),
        color: theme.fgColor,
      ),
      child: Column(
        children: [
          for (int index = 0; index < players.length; index++) ...[
            LayoutBuilder(
              builder: (context, constraints) => Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '-',
                          style: theme.display9.copyWith(color: theme.redColor),
                        ),
                        Column(
                          children: [
                            Text(
                              '${formatPlayerNumber(index + 1)} - ${players[index].name.toLowerCase()}',
                              style: theme.display2.copyWith(
                                color: theme.secondaryTextColor,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              players[index].score.toString(),
                              style: theme.display2.copyWith(
                                color: players[index].score < 0
                                    ? theme.redColor
                                    : theme.textColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '+',
                          style: theme.display9.copyWith(color: theme.redColor),
                        ),
                      ],
                    ),
                  ),
                  // Left half for decrease
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: constraints.maxWidth / 2,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Gaimon.soft();
                        onDecrease(index);
                      },
                      child: const SizedBox.shrink(),
                    ),
                  ),
                  // Right half for increase
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    width: constraints.maxWidth / 2,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Gaimon.soft();
                        onIncrease(index);
                      },
                      child: const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
            if (index < players.length - 1)
              Divider(
                color: theme.borderColor,
                height: 1,
              ),
          ],
        ],
      ),
    );
  }
}
