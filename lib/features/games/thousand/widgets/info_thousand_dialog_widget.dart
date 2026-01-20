import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_dialog.dart';
import 'package:flutter/material.dart';
import 'package:not_static_icons/not_static_icons.dart';

class InfoThousandDialog extends StatelessWidget {
  const InfoThousandDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlurredDialog(
      backgroundColor: theme.bgColor,
      allowCompactHeight: true,
      children: [
        InfoRowWidget(
          context: context,
          cardName: ThousandCardsText.ace,
          title: S.of(context).ace,
          points: ThousandCardsPoints.ace,
          description: '',
        ),
        InfoRowWidget(
          context: context,
          cardName: ThousandCardsText.ten,
          title: ThousandCardsPoints.ten,
          points: ThousandCardsPoints.ten,
          description: '',
        ),
        InfoRowWidget(
          context: context,
          cardName: ThousandCardsText.king,
          title: S.of(context).king,
          points: ThousandCardsPoints.king,
          description: '',
        ),
        InfoRowWidget(
          context: context,
          cardName: ThousandCardsText.queen,
          title: S.of(context).queen,
          points: ThousandCardsPoints.queen,
          description: '',
        ),
        InfoRowWidget(
          context: context,
          cardName: ThousandCardsText.jack,
          title: S.of(context).jack,
          points: ThousandCardsPoints.jack,
          description: '',
        ),
        InfoRowWidget(
          context: context,
          cardName: ThousandCardsText.nine,
          title: ThousandCardsPoints.nine,
          points: UnoLikeGameCardsText.zero,
          description: '',
        ),
        InfoRowWidget(
          context: context,
          icon: HeartIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).thousandMarriageTwo,
          description: S.of(context).thousandMarriageOne,
          iconColor: theme.redColor,
        ),
        InfoRowWidget(
          context: context,
          icon: DiamondIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).thousandMarriageThree,
          description: S.of(context).thousandMarriageFour,
          iconColor: theme.redColor,
        ),
        InfoRowWidget(
          context: context,
          icon: ClubIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).thousandMarriageThree,
          description: S.of(context).thousandMarriageFour,
          iconColor: theme.textColor,
        ),
        InfoRowWidget(
          context: context,
          icon: SpadeIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).thousandMarriageThree,
          description: S.of(context).thousandMarriageFour,
          iconColor: theme.textColor,
        ),
        InfoRowWidget(
          context: context,
          icon: CircleAlertIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).thousandSpecialRulesTitleOne,
          points: '',
          description: S.of(context).thousandSpecialRulesTitleTwo,
          iconColor: theme.redColor,
        ),
      ],
    );
  }
}
