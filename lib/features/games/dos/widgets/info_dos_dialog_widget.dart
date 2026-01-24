import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_dialog.dart';
import 'package:flutter/material.dart';
import 'package:not_static_icons/not_static_icons.dart';

class InfoDosDialog extends StatelessWidget {
  const InfoDosDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlurredDialog(
      backgroundColor: theme.bgColor,
      allowCompactHeight: true,
      children: [
        InfoRowWidget(
          context: context,
          icon: GridPlus2Icon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).wildDrawTwoCardDosInfo,
          points: GameConst.twenty,
          description:
              S.of(context).canBeAnyColorChosenByTheCurrentPlayerIfDosInfo,
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
          description: S.of(context).eachCardHasANumberDeterminingItsValue,
        ),
      ],
    );
  }
}
