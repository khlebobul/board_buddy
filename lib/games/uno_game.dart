import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/widgets/bottom_game_widget.dart';
import 'package:board_buddy/widgets/custom_app_bar.dart';
import 'package:board_buddy/widgets/player_card.dart';
import 'package:board_buddy/widgets/players_indicator.dart';
import 'package:flutter/material.dart';

class UnoGame extends StatelessWidget {
  const UnoGame({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> players = [
      {'name': 'player 1', 'score': 0},
      {'name': 'name', 'score': 10},
      {'name': 'test', 'score': 20},
    ];
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).uno,
        // for testing
        onRightButtonPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: players
                    .map((player) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: PlayerCard(
                            playerName: player['name'],
                            score: player['score'],
                          ),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: players.asMap().entries.map((entry) {
                  final index = entry.key;
                  final player = entry.value;
                  final firstLetter =
                      player['name'].toString().characters.first;

                  return PlayerIndicator(
                    letter: firstLetter,
                    isActive: index == 0,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomGameBar(
        leftButtonText: S.of(context).rules,
        isArrow: true,
        rightButtonText: S.of(context).rules,
      ),
    );
  }
}
