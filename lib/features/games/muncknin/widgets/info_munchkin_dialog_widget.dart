import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class InfoMunchkinDialogWidget extends StatelessWidget {
  const InfoMunchkinDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: TextScramble(
                  text: S.of(context).close,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InfoRowWidget(
                    context: context,
                    iconPath: CustomIcons.rip,
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
                    title: S.of(context).cursed,
                    description: S.of(context).indicatesAnActiveCurse,
                  ),
                  InfoRowWidget(
                    context: context,
                    title: S.of(context).clearance,
                    description:
                        S.of(context).possiblyTheRemovalOfCursesOrDebuffs,
                  ),
                  InfoRowWidget(
                    context: context,
                    title: S.of(context).modifiers,
                    description: S
                        .of(context)
                        .buffsOrDebuffsAffectingCharactersitemsInfo,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
