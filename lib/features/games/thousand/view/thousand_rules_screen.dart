import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/bullet_poit_text.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_scroll_view.dart';
import 'package:flutter/material.dart';

class ThousandRulesScreen extends StatelessWidget {
  const ThousandRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: ThousandCardsText.thousand,
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
              RulesConst.thousandAge,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            Text(
              RulesConst.thousandPlayers,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).gameGoal,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S.of(context).thousandGoal,
              style: theme.display2.copyWith(color: theme.textColor),
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).preparation,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).thousandPreparationOne),
            BulletPointText(contentText: S.of(context).thousandPreparationTwo),
            BulletPointText(
                contentText: S.of(context).thousandPreparationThree),
            const SizedBox(height: 15),
            Text(
              S.of(context).biddingPhase,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText: S.of(context).thousandBiddingPhaseOne),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText: S.of(context).thousandBiddingPhaseTwo),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletThree,
                contentText: S.of(context).thousandBiddingPhaseThree),
            const SizedBox(height: 15),
            Text(
              S.of(context).marriage,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).thousandMarriageOne),
            BulletPointText(contentText: S.of(context).thousandMarriageTwo),
            BulletPointText(contentText: S.of(context).thousandMarriageThree),
            BulletPointText(contentText: S.of(context).thousandMarriageFour),
            const SizedBox(height: 15),
            Text(
              S.of(context).gameTurnTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText: S.of(context).thousandGameTurnTitleOne),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText: S.of(context).thousandGameTurnTitleTwo),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletThree,
                contentText: S.of(context).thousandGameTurnTitleThree),
            const SizedBox(height: 15),
            Text(
              S.of(context).setScoringTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).ace11Points),
            BulletPointText(contentText: S.of(context).ten10Points),
            BulletPointText(contentText: S.of(context).king4Points),
            BulletPointText(contentText: S.of(context).queen3Points),
            BulletPointText(contentText: S.of(context).jack2Points),
            BulletPointText(contentText: S.of(context).nine0Points),
            BulletPointText(contentText: S.of(context).thousandTotalPoints),
            const SizedBox(height: 15),
            Text(
              S.of(context).contractResolution,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).thousandContractResolutionOne),
            BulletPointText(
                contentText: S.of(context).thousandContractResolutionTwo),
            BulletPointText(
                contentText: S.of(context).thousandContractResolutionThree),
            const SizedBox(height: 15),
            Text(
              S.of(context).specialRulesTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).thousandSpecialRulesTitleOne),
            BulletPointText(
                contentText: S.of(context).thousandSpecialRulesTitleTwo),
            const SizedBox(height: 15),
            Text(
              S.of(context).victoryTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S.of(context).thousandVictoryRule,
              style: theme.display2,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
