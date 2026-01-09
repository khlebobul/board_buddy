import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_dialog.dart';
import 'package:flutter/material.dart';

class InfoMunchkinDialogWidget extends StatelessWidget {
  const InfoMunchkinDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlurredDialog(
      backgroundColor: theme.bgColor,
      allowCompactHeight: true,
      children: [
        InfoRowWidget(
          context: context,
          iconPath: CustomIcons.bone,
          description: S.of(context).marksADeadCharacterInfo,
        ),
        InfoRowWidget(
          context: context,
          iconPath: CustomIcons.male,
          description: S.of(context).charactersGenderMaleInfo,
        ),
        InfoRowWidget(
          context: context,
          iconPath: CustomIcons.female,
          description: S.of(context).charactersGenderFemaleInfo,
        ),
        InfoRowWidget(
          context: context,
          iconPath: CustomIcons.modifiers,
          description: S.of(context).buffsOrDebuffsAffectingCharactersitemsInfo,
        ),
        InfoRowWidget(
          context: context,
          iconPath: CustomIcons.dice,
          description: S.of(context).rollDiceLocale,
        ),
        InfoRowWidget(
          context: context,
          title: S.of(context).cursed,
          description: S.of(context).indicatesAnActiveCurse,
        ),
        InfoRowWidget(
          context: context,
          title: S.of(context).clearance,
          description: S.of(context).possiblyTheRemovalOfCursesOrDebuffs,
        ),
      ],
    );
  }
}
