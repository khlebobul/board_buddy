import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/bullet_poit_text.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_scroll_view.dart';
import 'package:flutter/material.dart';

class ScrabbleRulesScreen extends StatelessWidget {
  const ScrabbleRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).scrabble,
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
              RulesConst.scrabbleAge,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            Text(
              RulesConst.scrabblePlayers,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).gameGoal,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S.of(context).scrabbleGameObjectiveDescription,
              style: theme.display2.copyWith(color: theme.textColor),
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).scrabbleGameSetTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).scrabbleGameSetBoard),
            BulletPointText(contentText: S.of(context).scrabbleGameSetLetters),
            BulletPointText(
                contentText: S.of(context).scrabbleGameSetAccessories),
            const SizedBox(height: 15),
            Text(
              S.of(context).preparation,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).scrabblePreparationShuffle),
            BulletPointText(
                contentText: S.of(context).scrabblePreparationDrawTiles),
            BulletPointText(
                contentText: S.of(context).scrabblePreparationFirstTurnRule),
            const SizedBox(height: 15),
            Text(
              S.of(context).scrabbleTurnRulesTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText: S.of(context).scrabbleTurnRuleFirstWord),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText: S.of(context).scrabbleTurnRuleWordDirection),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletThree,
                contentText: S.of(context).scrabbleTurnRuleLetterPlacement),
            const SizedBox(height: 15),
            Text(
              S.of(context).scrabbleScoringTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).scrabbleScoringWordPoints),
            BulletPointText(
                contentText: S.of(context).scrabbleScoringBlueBonus),
            BulletPointText(contentText: S.of(context).scrabbleScoringRedBonus),
            const SizedBox(height: 15),
            Text(
              S.of(context).scrabbleFeaturesTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).scrabbleFeatureBlankTile),
            BulletPointText(
                contentText: S.of(context).scrabbleFeatureSevenTileBonus),
            BulletPointText(
                contentText: S.of(context).scrabbleFeatureRefillTiles),
            const SizedBox(height: 15),
            Text(
              S.of(context).endGameTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletOne,
                contentText: S.of(context).scrabbleEndGameNoTiles),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletTwo,
                contentText: S.of(context).scrabbleEndGameSkippedTurns),
            BulletPointText(
                pointSimbol: BulletPointsConst.bulletThree,
                contentText:
                    S.of(context).scrabbleEndGameRemainingTilesPenalty),
            const SizedBox(height: 15),
            Text(
              S.of(context).scrabbleAdditionalPointsTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).scrabbleAdditionalReplaceTiles),
            BulletPointText(
                contentText: S.of(context).scrabbleAdditionalDisputedWords),
            BulletPointText(
                contentText: S.of(context).scrabbleAdditionalWordRules),
            const SizedBox(height: 20),
            Text(
              S.of(context).scrabbleTrademarkNotice,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
