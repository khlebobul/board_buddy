import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/src/config/theme/app_theme.dart';
import 'package:board_buddy/src/config/constants/app_constants.dart';
import 'package:board_buddy/src/shared/widgets/ui/bullet_poit_text.dart';
import 'package:board_buddy/src/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';

class UnoFlipRulesScreen extends StatelessWidget {
  const UnoFlipRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).unoFlip,
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
                  RulesConst.unoFlipAge,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                Text(
                  RulesConst.unoFlipPlayers,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).gameGoal,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  S.of(context).unoFlipGameObjectiveDescription,
                  style: theme.display2.copyWith(color: theme.textColor),
                ),
                const SizedBox(height: 15),
                Text(
                  S.of(context).unoFlipGameStartTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).unoFlipGameStartDealCards),
                BulletPointText(
                    contentText: S.of(context).unoFlipGameStartLightSide),
                const SizedBox(height: 15),
                Text(
                  S.of(context).gameTurnTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).unoFlipTurnRuleMatchCard),
                BulletPointText(
                    contentText: S.of(context).unoFlipTurnRuleDrawCard),
                BulletPointText(
                    contentText: S.of(context).unoFlipTurnRuleFlipCard),
                const SizedBox(height: 15),
                Text(
                  S.of(context).unoActiveCardsTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  S.of(context).unoFlipLightSideCardsTitle,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                BulletPointText(
                    contentText: S.of(context).unoFlipLightSideDrawOne),
                BulletPointText(
                    contentText: S.of(context).unoFlipLightSideReverse),
                BulletPointText(
                    contentText: S.of(context).unoFlipLightSideSkipTurn),
                BulletPointText(
                    contentText: S.of(context).unoFlipLightSideWildCard),
                BulletPointText(
                    contentText: S.of(context).unoFlipLightSideWildDrawTwo),
                const SizedBox(height: 10),
                Text(
                  S.of(context).unoFlipDarkSideCardsTitle,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                BulletPointText(
                    contentText: S.of(context).unoFlipDarkSideDrawFive),
                BulletPointText(
                    contentText: S.of(context).unoFlipDarkSideReverse),
                BulletPointText(
                    contentText: S.of(context).unoFlipDarkSideSkipAll),
                BulletPointText(
                    contentText: S.of(context).unoFlipDarkSideWildCard),
                BulletPointText(
                    contentText: S.of(context).unoFlipDarkSideDrawUntilColor),
                const SizedBox(height: 15),
                Text(
                  S.of(context).unoFlipKeyMoment,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).unoFlipKeyMomentFlipCardEffect),
                BulletPointText(
                    contentText: S.of(context).unoFlipKeyMomentUnoCall),
                const SizedBox(height: 15),
                Text(
                  S.of(context).unoFlipScoringTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(S.of(context).unoFlipScoringRoundWinnerPoints,
                    style: theme.display2),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletOne,
                    contentText: S.of(context).unoFlipScoringNumberCards),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletTwo,
                    contentText: S.of(context).unoFlipScoringActiveCards),
                const SizedBox(height: 15),
                Text(
                  S.of(context).victoryTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).unoFlipVictory500Points),
                BulletPointText(
                    contentText:
                        S.of(context).unoFlipVictoryLowestScoreAlternative),
                const SizedBox(height: 20),
                Text(
                  S.of(context).unoFlipTrademarkNotice,
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
