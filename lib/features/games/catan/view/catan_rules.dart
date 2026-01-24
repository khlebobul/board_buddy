import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/bullet_poit_text.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_scroll_view.dart';
import 'package:flutter/material.dart';

class CatanRulesScreen extends StatelessWidget {
  const CatanRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return Scaffold(
      backgroundColor: theme.bgColor,
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).catan,
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
              RulesConst.catanAge,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            Text(
              RulesConst.catanPlayers,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).gameGoal,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S.of(context).catanGameGoal,
              style: theme.display2.copyWith(color: theme.textColor),
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).scrabbleGameSetTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).catanComponentsOne),
            BulletPointText(contentText: S.of(context).catanComponentsTwo),
            BulletPointText(contentText: S.of(context).catanComponentsThree),
            BulletPointText(contentText: S.of(context).catanComponentsFour),
            BulletPointText(contentText: S.of(context).catanComponentsFive),
            BulletPointText(contentText: S.of(context).catanComponentsSix),
            BulletPointText(contentText: S.of(context).catanComponentsSeven),
            BulletPointText(contentText: S.of(context).catanComponentsEight),
            BulletPointText(contentText: S.of(context).catanComponentsNine),
            const SizedBox(height: 15),
            Text(
              S.of(context).preparation,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText: S.of(context).catanPreparationOne),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText: S.of(context).catanPreparationTwo),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletThree,
                contentText: S.of(context).catanPreparationThree),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletFour,
                contentText: S.of(context).catanPreparationFour),
            const SizedBox(height: 15),
            Text(
              S.of(context).resources,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).catanResourcesOne),
            BulletPointText(contentText: S.of(context).catanResourcesTwo),
            BulletPointText(contentText: S.of(context).catanResourcesThree),
            BulletPointText(contentText: S.of(context).catanResourcesFour),
            BulletPointText(contentText: S.of(context).catanResourcesFive),
            BulletPointText(contentText: S.of(context).catanResourcesSix),
            const SizedBox(height: 15),
            Text(
              S.of(context).gameTurnTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText: S.of(context).catanGameTurnOne),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText: S.of(context).catanGameTurnTwo),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletThree,
                contentText: S.of(context).catanGameTurnThree),
            const SizedBox(height: 15),
            Text(
              S.of(context).buildingCosts,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).catanBuildingCostsOne),
            BulletPointText(contentText: S.of(context).catanBuildingCostsTwo),
            BulletPointText(contentText: S.of(context).catanBuildingCostsThree),
            BulletPointText(contentText: S.of(context).catanBuildingCostsFour),
            const SizedBox(height: 15),
            Text(
              S.of(context).developmentCards,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).catanDevelopmentCardsOne),
            BulletPointText(
                contentText: S.of(context).catanDevelopmentCardsTwo),
            BulletPointText(
                contentText: S.of(context).catanDevelopmentCardsThree),
            BulletPointText(
                contentText: S.of(context).catanDevelopmentCardsFour),
            const SizedBox(height: 15),
            Text(
              S.of(context).theRobberRolling7,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText: S.of(context).catanTheRobberRolling7One),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText: S.of(context).catanTheRobberRolling7Two),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletThree,
                contentText: S.of(context).catanTheRobberRolling7Three),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletFour,
                contentText: S.of(context).catanTheRobberRolling7Four),
            const SizedBox(height: 15),
            Text(
              S.of(context).specialCards2VpEach,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).catanSpecialCards2VpEachOne),
            BulletPointText(
                contentText: S.of(context).catanSpecialCards2VpEachTwo),
            const SizedBox(height: 15),
            Text(
              S.of(context).buildingRules,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).catanBuildingRulesOne),
            BulletPointText(contentText: S.of(context).catanBuildingRulesTwo),
            BulletPointText(contentText: S.of(context).catanBuildingRulesThree),
            BulletPointText(contentText: S.of(context).catanBuildingRulesFour),
            const SizedBox(height: 15),
            Text(
              S.of(context).trading,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).catanTradingOne),
            BulletPointText(contentText: S.of(context).catanTradingTwo),
            BulletPointText(contentText: S.of(context).catanTradingThree),
            const SizedBox(height: 15),
            Text(
              S.of(context).setScoringTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).catanScoringOne),
            BulletPointText(contentText: S.of(context).catanScoringTwo),
            BulletPointText(contentText: S.of(context).catanScoringThree),
            BulletPointText(contentText: S.of(context).catanScoringFour),
            BulletPointText(contentText: S.of(context).catanScoringFive),
            const SizedBox(height: 15),
            Text(
              S.of(context).victoryTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S.of(context).catanVictoryRule,
              style: theme.display2,
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).catanTrademarkNotice,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
