import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:flutter/material.dart';

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
                child: Icon(Icons.close, color: theme.secondaryTextColor),
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
                    points: GameConst.forty,
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
