import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/game_widgets/player_card.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_indicator.dart';
import 'package:board_buddy/features/games/uno/widgets/info_uno_dialog_widget.dart';
import 'package:flutter/material.dart';

/// uno game screen
class UnoGame extends StatelessWidget {
  final List<Player> players;
  final int scoreLimit;
  final String gameMode;

  const UnoGame({
    super.key,
    required this.players,
    required this.scoreLimit,
    required this.gameMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        isRules: true,
        rightButtonText: S.of(context).rules,
        onRightButtonPressed: () => Navigator.pushNamed(context, '/unoRules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    gameMode,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '${S.of(context).score}: $scoreLimit',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: players
                    .map((player) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: PlayerCard(
                            player: player,
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
                  final firstLetter = player.name.characters.first;
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
        dialogWidget: const InfoUnoDialog(),
        isArrow: true,
        rightButtonText: S.of(context).finish,
      ),
    );
  }
}
