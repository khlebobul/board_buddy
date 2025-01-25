import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/models/player_model.dart';
import 'package:board_buddy/widgets/app_widgets/custom_app_bar.dart';
import 'package:board_buddy/widgets/game_widgets/players_score_widget.dart';
import 'package:flutter/material.dart';

class SetGame extends StatelessWidget {
  const SetGame({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).set,
        onRightButtonPressed: () {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PlayersScoreWidget(
            players: [
              Player(name: 'Player 1', score: 0, id: 1),
            ],
            onIncrease: (index) {
              debugPrint('Increase score for player $index');
            },
            onDecrease: (index) {
              debugPrint('Decrease score for player $index');
            },
          ),
        ],
      ),
    );
  }
}
