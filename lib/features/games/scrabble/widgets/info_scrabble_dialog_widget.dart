import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class InfoscrabbleDialog extends StatelessWidget {
  const InfoscrabbleDialog({super.key});

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
                    cardName: GameConst.scrabblex2,
                    description:
                        S.of(context).doublesTheValueOfALetterScrabbleInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    cardName: GameConst.scrabblex3,
                    description:
                        S.of(context).tripleTheValueOfALetterScrabbleInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    iconPath: CustomIcons.star,
                    description:
                        S.of(context).bonusTileOrSpecialMarkerScrabbleInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    isScrabble: true,
                    cardName: '${GameConst.scrabblex2}${S.of(context).nWord}',
                    description:
                        S.of(context).doublesTheValueOfAnEntireWordScrabbleInfo,
                  ),
                  InfoRowWidget(
                    context: context,
                    isScrabble: true,
                    cardName: '${GameConst.scrabblex3}${S.of(context).nWord}',
                    description:
                        S.of(context).tripleTheValueOfAnEntireWordScrabbleInfo,
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
