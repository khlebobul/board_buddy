import 'package:board_buddy/models/player_model.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/useful_methods.dart';
import 'package:flutter/material.dart';

class PlayersScoreWidget extends StatelessWidget {
  final List<Player> players;
  final void Function(int index) onIncrease;
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => onDecrease(0),
                child: Text(
                  '-',
                  style: theme.display1.copyWith(color: theme.redColor),
                ),
              ),
              Text(
                players[0].score.toString(),
                style: theme.display2.copyWith(
                  color: theme.textColor,
                ),
              ),
              GestureDetector(
                onTap: () => onIncrease(0),
                child: Text(
                  '+',
                  style: theme.display1.copyWith(color: theme.redColor),
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => onDecrease(index),
                    child: Text(
                      '-',
                      style: theme.display1.copyWith(color: theme.redColor),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '${formatPlayerNumber(index + 1)} - ${players[index].name.toLowerCase()}',
                        style: theme.display2.copyWith(
                          color: theme.textColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        players[index].score.toString(),
                        style: theme.display2.copyWith(
                          color: theme.textColor,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => onIncrease(index),
                    child: Text(
                      '+',
                      style: theme.display1.copyWith(color: theme.redColor),
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
