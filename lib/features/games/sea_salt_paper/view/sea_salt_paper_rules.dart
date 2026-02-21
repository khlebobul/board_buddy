import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/bullet_poit_text.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_scroll_view.dart';
import 'package:flutter/material.dart';

class SeaSaltPaperRulesScreen extends StatelessWidget {
  const SeaSaltPaperRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).seaSaltPaper,
        onRightButtonPressed: () {},
      ),
      body: SafeArea(
        child: BlurredScrollView(
          maskColor: theme.bgColor,
          padding: const EdgeInsets.symmetric(
                  horizontal: GeneralConst.paddingHorizontal) +
              const EdgeInsets.only(top: GeneralConst.paddingVertical),
          children: [
            Text(
              RulesConst.seaSaltPaperAge,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            Text(
              RulesConst.seaSaltPaperPlayers,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).gameGoal,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S.of(context).seaSaltPaperGameObjectiveDescription,
              style: theme.display2.copyWith(color: theme.textColor),
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).preparation,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).seaSaltPaperPreparationShuffle),
            BulletPointText(
                contentText: S.of(context).seaSaltPaperPreparationDiscard),
            BulletPointText(
                contentText: S.of(context).seaSaltPaperPreparationStartPlayer),
            const SizedBox(height: 15),
            Text(
              S.of(context).gameTurnTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S.of(context).seaSaltPaperTurnDescription,
              style: theme.display2,
            ),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText: S.of(context).seaSaltPaperTurnDrawTwo),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText: S.of(context).seaSaltPaperTurnTakeDiscard),
            const SizedBox(height: 15),
            Text(
              S.of(context).seaSaltPaperDuoCardsTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S.of(context).seaSaltPaperDuoCardsDescription,
              style: theme.display2,
            ),
            BulletPointText(contentText: S.of(context).seaSaltPaperDuoCrab),
            BulletPointText(contentText: S.of(context).seaSaltPaperDuoBoat),
            BulletPointText(contentText: S.of(context).seaSaltPaperDuoFish),
            BulletPointText(contentText: S.of(context).seaSaltPaperDuoShark),
            const SizedBox(height: 15),
            Text(
              S.of(context).seaSaltPaperEndRoundTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S.of(context).seaSaltPaperEndRoundDescription,
              style: theme.display2,
            ),
            BulletPointText(contentText: S.of(context).seaSaltPaperStopOption),
            BulletPointText(
                contentText: S.of(context).seaSaltPaperLastChanceOption),
            const SizedBox(height: 15),
            Text(
              S.of(context).seaSaltPaperScoringTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).seaSaltPaperScoringPairs),
            BulletPointText(
                contentText: S.of(context).seaSaltPaperScoringCollections),
            BulletPointText(
                contentText: S.of(context).seaSaltPaperScoringColorMajority),
            BulletPointText(
                contentText: S.of(context).seaSaltPaperScoringMermaid),
            const SizedBox(height: 15),
            Text(
              S.of(context).victoryTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).seaSaltPaperVictory2Players),
            BulletPointText(
                contentText: S.of(context).seaSaltPaperVictory3Players),
            BulletPointText(
                contentText: S.of(context).seaSaltPaperVictory4Players),
            const SizedBox(height: 20),
            Text(
              S.of(context).seaSaltPaperTrademarkNotice,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
