import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/bullet_poit_text.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_scroll_view.dart';
import 'package:flutter/material.dart';

class MunchkinRulesScreen extends StatelessWidget {
  const MunchkinRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).munchkin,
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
              RulesConst.munchkinAge,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            Text(
              RulesConst.munchkinPlayers,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).gameGoal,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S.of(context).munchkinGameObjectiveDescription,
              style: theme.display2.copyWith(color: theme.textColor),
            ),
            const SizedBox(height: 15),
            Text(
              S.of(context).preparation,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).munchkinShuffleCardsInstruction),
            BulletPointText(
                contentText: S.of(context).munchkinInitialCardsInstruction),
            BulletPointText(
                contentText: S.of(context).munchkinStartingGearInstruction),
            const SizedBox(height: 15),
            Text(
              S.of(context).gameTurnTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(
              S.of(context).munchkinTurnDescription,
              style: theme.display2,
            ),
            BulletPointText(
                contentText: S.of(context).munchkinMonsterEncounter),
            BulletPointText(contentText: S.of(context).munchkinCurseEncounter),
            BulletPointText(
                contentText: S.of(context).munchkinOtherCardEncounter),
            Text(S.of(context).munchkinNoMonsterActionsTitle,
                style:
                    theme.display2.copyWith(color: theme.secondaryTextColor)),
            BulletPointText(
                contentText: S.of(context).munchkinNoMonsterActionsDescription),
            const SizedBox(height: 10),
            Text(
              S.of(context).munchkinCombatTitle,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            BulletPointText(
                contentText: S.of(context).munchkinCombatCompareLevels),
            BulletPointText(
                contentText: S.of(context).munchkinCombatWinCondition),
            BulletPointText(
                contentText: S.of(context).munchkinCombatHelpOrBoost),
            BulletPointText(
                contentText: S.of(context).munchkinCombatEscapeRules),
            const SizedBox(height: 10),
            Text(S.of(context).munchkinEndTurnDiscardRules,
                style: theme.display2),
            const SizedBox(height: 15),
            Text(
              S.of(context).cardTypesTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).munchkinMonstersCardType),
            BulletPointText(
                contentText: S.of(context).munchkinEquipmentCardType),
            BulletPointText(contentText: S.of(context).munchkinCursesCardType),
            BulletPointText(
                contentText: S.of(context).munchkinMonsterEnhancersCardType),
            BulletPointText(
                contentText: S.of(context).munchkinOneTimeItemsCardType),
            const SizedBox(height: 15),
            Text(
              S.of(context).specialRulesTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            BulletPointText(
                contentText: S.of(context).munchkinMonsterVictoryReward),
            BulletPointText(
                contentText: S.of(context).munchkinLevel10Condition),
            BulletPointText(contentText: S.of(context).munchkinDeathRules),
            const SizedBox(height: 15),
            Text(
              S.of(context).victoryTitle,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
            Text(S.of(context).munchkinVictoryCondition, style: theme.display2),
            const SizedBox(height: 20),
            Text(
              S.of(context).munchkinTrademarkNotice,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
