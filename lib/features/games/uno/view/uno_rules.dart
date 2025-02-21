import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/bullet_poit_text.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';

class UnoRulesScreen extends StatelessWidget {
  const UnoRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).uno,
        onRightButtonPressed: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                    horizontal: GeneralConst.paddingHorizontal) +
                const EdgeInsets.only(top: GeneralConst.paddingVertical),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  RulesConst.unoAge,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                Text(
                  RulesConst.unoPlayers,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).gameGoal,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  S.of(context).unoGameObjectiveDescription,
                  style: theme.display2.copyWith(color: theme.textColor),
                ),
                const SizedBox(height: 15),
                Text(
                  S.of(context).preparation,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).unoPreparationDistributeCards),
                BulletPointText(
                    contentText: S.of(context).unoPreparationDeckInCenter),
                BulletPointText(
                    contentText: S.of(context).unoPreparationFlipFirstCard),
                const SizedBox(height: 15),
                Text(
                  S.of(context).gameTurnTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletOne,
                    contentText: S.of(context).unoTurnRuleMatchCard),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletTwo,
                    contentText: S.of(context).unoTurnRuleDrawCard),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletThree,
                    contentText: S.of(context).unoTurnRuleOptionalDraw),
                const SizedBox(height: 15),
                Text(
                  S.of(context).unoActiveCardsTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).unoActiveCardSkipTurn),
                BulletPointText(
                    contentText: S.of(context).unoActiveCardDrawTwo),
                BulletPointText(
                    contentText: S.of(context).unoActiveCardReverse),
                BulletPointText(contentText: S.of(context).unoActiveCardWild),
                BulletPointText(
                    contentText: S.of(context).unoActiveCardWildDrawFour),
                const SizedBox(height: 15),
                Text(
                  S.of(context).specialCardsTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(contentText: S.of(context).unoSpecialCardSwap),
                BulletPointText(contentText: S.of(context).unoSpecialCardBlank),
                const SizedBox(height: 15),
                Text(
                  S.of(context).specialRulesTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).unoSpecialRuleUnoCall),
                BulletPointText(
                    contentText: S.of(context).unoSpecialRuleReshuffle),
                const SizedBox(height: 15),
                Text(
                  S.of(context).unoScoringTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(S.of(context).unoScoringNumberCards,
                    style: theme.display2),
                BulletPointText(
                    contentText: S.of(context).unoScoring20PointsCards),
                BulletPointText(
                    contentText: S.of(context).unoScoring50PointsCards),
                BulletPointText(
                    contentText: S.of(context).unoScoring40PointsCards),
                const SizedBox(height: 15),
                Text(
                  S.of(context).victoryTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(contentText: S.of(context).unoVictory500Points),
                BulletPointText(
                    contentText:
                        S.of(context).unoVictoryLowestScoreAlternative),
                const SizedBox(height: 20),
                Text(
                  S.of(context).unoTrademarkNotice,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
