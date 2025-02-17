import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/src/config/theme/app_theme.dart';
import 'package:board_buddy/src/config/constants/app_constants.dart';
import 'package:board_buddy/src/config/utils/custom_icons.dart';
import 'package:board_buddy/src/shared/widgets/ui/info_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class InfoDosDialog extends StatelessWidget {
  const InfoDosDialog({super.key});

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
                    iconPath: CustomIcons.wildDrawTwoDos,
                    title: S.of(context).wildDrawTwoCardDosInfo,
                    points: GameConst.twenty,
                    description: S
                        .of(context)
                        .canBeAnyColorChosenByTheCurrentPlayerIfDosInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    cardName: GameConst.wildCardDos,
                    title: S.of(context).wildCardOneDosInfo,
                    points: GameConst.fifty,
                    description: S
                        .of(context)
                        .canRepresentAnyNumberForItsOwnParticularColorDosInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    title: S.of(context).numberCards,
                    points: GameConst.oneToTen,
                    description:
                        S.of(context).eachCardHasANumberDeterminingItsValue,
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
