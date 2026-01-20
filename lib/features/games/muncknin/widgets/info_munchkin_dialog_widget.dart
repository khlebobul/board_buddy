import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_dialog.dart';
import 'package:flutter/material.dart';
import 'package:not_static_icons/not_static_icons.dart';

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
          icon: BoneIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          description: S.of(context).marksADeadCharacterInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: MarsIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          description: S.of(context).charactersGenderMaleInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: VenusIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          description: S.of(context).charactersGenderFemaleInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: BicepsFlexedIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          description: S.of(context).buffsOrDebuffsAffectingCharactersitemsInfo,
        ),
        InfoRowWidget(
          context: context,
          icon: BoxIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
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
