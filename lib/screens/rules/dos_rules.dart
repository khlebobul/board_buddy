import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/app_constants.dart';
import 'package:board_buddy/widgets/app_widgets/bullet_poit_text.dart';
import 'package:board_buddy/widgets/app_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DosRulesScreen extends StatelessWidget {
  const DosRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).dos,
        onRightButtonPressed: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12) +
                const EdgeInsets.only(top: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dosAge,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                Text(
                  dosPlayers,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).dosGameObjectiveTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  S.of(context).dosGameObjectiveDescription,
                  style: theme.display2.copyWith(color: theme.textColor),
                ),
                const SizedBox(height: 15),
                Text(
                  S.of(context).preparation,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).dosPreparationDealCards),
                BulletPointText(
                    contentText: S.of(context).dosPreparationCentralRow),
                BulletPointText(
                    contentText: S.of(context).dosPreparationDrawPile),
                const SizedBox(height: 15),
                Text(
                  S.of(context).gameTurnTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    pointSimbol: bulletOne,
                    contentText: S.of(context).dosTurnRulePickCards),
                BulletPointText(
                    contentText: S.of(context).dosTurnRuleSingleMatch),
                BulletPointText(
                    contentText: S.of(context).dosTurnRuleDoubleMatch),
                BulletPointText(
                    pointSimbol: bulletTwo,
                    contentText: S.of(context).dosTurnRuleDrawCard),
                BulletPointText(
                    pointSimbol: bulletThree,
                    contentText: S.of(context).dosTurnRuleEndTurn),
                const SizedBox(height: 15),
                Text(
                  S.of(context).dosBonus,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).dosBonusNumberColorMatchAddCard),
                BulletPointText(
                    contentText:
                        S.of(context).dosBonusDoubleColorMatchDrawCard),
                const SizedBox(height: 15),
                Text(
                  S.of(context).specialCardsTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).dosSpecialCardWildDos),
                BulletPointText(
                    contentText: S.of(context).dosSpecialCardWildNumber),
                const SizedBox(height: 15),
                Text(
                  S.of(context).dosSpecialRule,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  S.of(context).dosSpecialRuleDosCall,
                  style: theme.display2,
                ),
                const SizedBox(height: 15),
                Text(
                  S.of(context).dosScoring,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                BulletPointText(
                    contentText: S.of(context).dosScoringNumberCards),
                BulletPointText(contentText: S.of(context).dosScoringWildDos),
                BulletPointText(
                    contentText: S.of(context).dosScoringWildNumber),
                const SizedBox(height: 15),
                Text(
                  S.of(context).victoryTitle,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  S.of(context).dosVictory200Points,
                  style: theme.display2,
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).dosTrademarkNotice,
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
