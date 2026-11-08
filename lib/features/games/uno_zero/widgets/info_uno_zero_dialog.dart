import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_dialog.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:flutter/material.dart';

class InfoUnoZeroDialog extends StatelessWidget {
  const InfoUnoZeroDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlurredDialog(
      backgroundColor: theme.bgColor,
      allowCompactHeight: true,
      children: [
        InfoRowWidget(
          context: context,
          cardName: '0-6',
          description: S.of(context).unoZeroScoringNumbers,
        ),
        InfoRowWidget(
          context: context,
          cardName: '+',
          title: S.of(context).specialCardsTitle,
          description: S.of(context).unoZeroActionInGrid,
        ),
        InfoRowWidget(
          context: context,
          cardName: '9',
          title: S.of(context).victoryTitle,
          description: S.of(context).unoZeroVictory,
        ),
      ],
    );
  }
}
