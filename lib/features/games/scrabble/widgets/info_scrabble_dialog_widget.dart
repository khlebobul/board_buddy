import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_dialog.dart';
import 'package:flutter/material.dart';

class InfoscrabbleDialog extends StatelessWidget {
  const InfoscrabbleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlurredDialog(
      backgroundColor: theme.bgColor,
      allowCompactHeight: true,
      children: [
        InfoRowWidget(
          context: context,
          cardName: GameConst.scrabblex2,
          description: S.of(context).doublesTheValueOfALetterScrabbleInfo,
        ),
        InfoRowWidget(
          context: context,
          cardName: GameConst.scrabblex3,
          description: S.of(context).tripleTheValueOfALetterScrabbleInfo,
        ),
        InfoRowWidget(
          context: context,
          iconPath: CustomIcons.star,
          description: S.of(context).bonusTileOrSpecialMarkerScrabbleInfo,
        ),
        InfoRowWidget(
          context: context,
          isScrabble: true,
          cardName: '${GameConst.scrabblex2}${S.of(context).nWord}',
          description: S.of(context).doublesTheValueOfAnEntireWordScrabbleInfo,
        ),
        InfoRowWidget(
          context: context,
          isScrabble: true,
          cardName: '${GameConst.scrabblex3}${S.of(context).nWord}',
          description: S.of(context).tripleTheValueOfAnEntireWordScrabbleInfo,
        ),
        InfoRowWidget(
          context: context,
          cardName: '',
          description:
              '${S.of(context).bingo}: ${S.of(context).score50ExtraPointsForUsingAll7Tiles}',
        ),
      ],
    );
  }
}
