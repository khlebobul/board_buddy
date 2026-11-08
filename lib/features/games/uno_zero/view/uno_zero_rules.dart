import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_scroll_view.dart';
import 'package:board_buddy/shared/widgets/ui/bullet_poit_text.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';

class UnoZeroRulesScreen extends StatelessWidget {
  const UnoZeroRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: GameNames.unoZero,
        onRightButtonPressed: () {},
      ),
      body: SafeArea(
        child: BlurredScrollView(
          maskColor: theme.bgColor,
          padding:
              const EdgeInsets.symmetric(
                horizontal: GeneralConst.paddingHorizontal,
              ) +
              const EdgeInsets.only(top: GeneralConst.paddingVertical),
          children: [
            Text(
              RulesConst.unoZeroAge,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            Text(
              RulesConst.unoZeroPlayers,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).gameGoal,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S.of(context).unoZeroGameObjectiveDescription,
              style: theme.display2.copyWith(color: theme.textColor),
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).preparation,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).unoZeroPreparationDeal),
            BulletPointText(contentText: S.of(context).unoZeroPreparationGrid),
            BulletPointText(
              contentText: S.of(context).unoZeroPreparationFirstPlayer,
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).gameTurnTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
              pointSimbol: BulletPointsConst.bulletOne,
              contentText: S.of(context).unoZeroTurnDraw,
            ),
            BulletPointText(contentText: S.of(context).unoZeroTurnKeep),
            BulletPointText(
              pointSimbol: BulletPointsConst.bulletTwo,
              contentText: S.of(context).unoZeroTurnDiscardPile,
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).unoZeroClearColumnTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(S.of(context).unoZeroClearColumn, style: theme.display2),
            const SizedBox(height: 15),
            Text(
              S.of(context).specialCardsTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).unoZeroActionReverse),
            BulletPointText(contentText: S.of(context).unoZeroActionSkip),
            BulletPointText(contentText: S.of(context).unoZeroActionDrawTwo),
            BulletPointText(
              contentText: S.of(context).unoZeroActionDoubleDrawTwo,
            ),
            BulletPointText(contentText: S.of(context).unoZeroActionInGrid),
            const SizedBox(height: 15),
            Text(
              S.of(context).unoZeroUnoCallTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(S.of(context).unoZeroUnoCall, style: theme.display2),
            const SizedBox(height: 15),
            Text(
              S.of(context).unoZeroEndRoundTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(S.of(context).unoZeroEndRound, style: theme.display2),
            const SizedBox(height: 15),
            Text(
              S.of(context).unoZeroScoringTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(contentText: S.of(context).unoZeroScoringNumbers),
            const SizedBox(height: 15),
            Text(
              S.of(context).victoryTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(S.of(context).unoZeroVictory, style: theme.display2),
            const SizedBox(height: 20),
            Text(
              S.of(context).unoZeroTrademarkNotice,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
