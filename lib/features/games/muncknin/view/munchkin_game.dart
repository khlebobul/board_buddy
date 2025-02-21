import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/bottom_sheets/munchkin_modifiers_bs.dart';
import 'package:board_buddy/features/games/muncknin/widgets/munchkin_score_widget.dart';
import 'package:board_buddy/features/games/muncknin/widgets/info_munchkin_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

/// munchkin game screen
class MunchkinGame extends StatelessWidget {
  const MunchkinGame({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final players = [
      Player(name: 'Player 1', score: 0, id: 1),
    ];
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        isRules: true,
        rightButtonText: S.of(context).rules,
        onRightButtonPressed: () => Navigator.pushNamed(context, '/munchkinRules'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: GeneralConst.paddingHorizontal),
        child: Column(
          children: [
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: players
            //         .map((player) => Padding(
            //               padding: const EdgeInsets.only(right: 20.0),
            //               child: MunchkinScoreWidget(
            //                 playerName: player.name,
            //                 totalScore: player.score,
            //                 gearScore: 0,
            //                 level: 0,
            //                 onDecrease: print,
            //                 onIncrease: print,
            //                 isSinglePlayer: true,
            //               ),
            //             ))
            //         .toList(),
            //   ),
            // ),
            MunchkinScoreWidget(
              playerName: players.first.name,
              totalScore: players.first.score,
              gearScore: 0,
              level: 0,
              onDecrease: print,
              onIncrease: print,
              isSinglePlayer: true,
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const MunchkinModifiersBottomSheet(),
              ),
              child: TextScramble(
                text: S.of(context).modifiers,
                style: theme.display2.copyWith(color: theme.redColor),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomGameBar(
        dialogWidget: const InfoMunchkinDialogWidget(),
        isArrow: true,
        rightButtonText: S.of(context).finish,
      ),
    );
  }
}
