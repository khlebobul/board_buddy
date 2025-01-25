import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/widgets/app_widgets/custom_app_bar.dart';
import 'package:board_buddy/widgets/game_widgets/munchkin_score_widget.dart';
import 'package:flutter/material.dart';

class MunchkinGame extends StatelessWidget {
  const MunchkinGame({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = UIThemes.of(context);
    final List<Map<String, dynamic>> players = [
      {'name': 'player 1', 'score': 0},
      {'name': 'name', 'score': 10},
      {'name': 'test', 'score': 20},
    ];
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).munchkin,
        onRightButtonPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: players
                    .map((player) => Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: MunchkinScoreWidget(
                            playerName: player['name'],
                            totalScore: player['score'],
                            
                            gearScore: 0,
                            level: 0,
                            onDecrease: print,
                            onIncrease: print,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
