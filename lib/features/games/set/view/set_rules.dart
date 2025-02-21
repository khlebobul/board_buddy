import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/bullet_poit_text.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SetRulesScreen extends StatelessWidget {
  const SetRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).set,
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
                  RulesConst.setAge,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                Text(
                  RulesConst.setPlayers,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).gameGoal,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  S.of(context).setGameObjectiveDescription,
                  style: theme.display2.copyWith(color: theme.textColor),
                ),
                const SizedBox(height: 15),
                Text(
                  S.of(context).setCardAttributesTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  S.of(context).setCardAttributesDescription,
                  style: theme.display2,
                ),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletOne,
                    contentText: S.of(context).setCardAttributeNumberOfSymbols),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletTwo,
                    contentText: S.of(context).setCardAttributeSymbolType),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletThree,
                    contentText: S.of(context).setCardAttributeSymbolColor),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletFour,
                    contentText: S.of(context).setCardAttributeFillType),
                const SizedBox(height: 15),
                Text(
                  S.of(context).gameTurnTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletOne,
                    contentText: S.of(context).setGameTurnStepDealerSetup),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletTwo,
                    contentText: S.of(context).setGameTurnStepFindingSet),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletThree,
                    contentText: S.of(context).setGameTurnStepValidation),
                BulletPointText(
                    pointSimbol: BulletPointsConst.bulletFour,
                    contentText: S.of(context).setGameTurnStepFour),
                const SizedBox(height: 15),
                Text(
                  S.of(context).setGameTurnStepContinue,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).setExampleOfValidSetTitle),
                BulletPointText(
                    contentText: S.of(context).setExampleOfValidSetNumber),
                BulletPointText(
                    contentText: S.of(context).setExampleOfValidSetType),
                BulletPointText(
                    contentText: S.of(context).setExampleOfValidSetFill),
                const SizedBox(height: 15),
                Text(
                  S.of(context).setNoSetFoundTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(S.of(context).setNoSetFoundDescription,
                    style: theme.display2),
                const SizedBox(height: 15),
                Text(
                  S.of(context).setScoringTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).setScoringPointPerSet),
                BulletPointText(contentText: S.of(context).setScoringGameEnd),
                const SizedBox(height: 15),
                Text(
                  S.of(context).setImportantRulesTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).setImportantRuleConfirmation),
                BulletPointText(
                    contentText: S.of(context).setImportantRuleCardPosition),
                BulletPointText(
                    contentText: S.of(context).setImportantRuleSimplifiedMode),
                const SizedBox(height: 20),
                Text(
                  S.of(context).setTrademarkNotice,
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
