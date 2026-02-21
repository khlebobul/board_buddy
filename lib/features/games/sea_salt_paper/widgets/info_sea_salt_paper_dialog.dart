import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_dialog.dart';
import 'package:flutter/material.dart';
import 'package:not_static_icons/not_static_icons.dart';

class InfoSeaSaltPaperDialog extends StatelessWidget {
  const InfoSeaSaltPaperDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlurredDialog(
      backgroundColor: theme.bgColor,
      children: [
        InfoRowWidget(
          context: context,
          title: GameConst.oneToSeven,
          description: S.of(context).numberButtonsDescription,
        ),
        InfoRowWidget(
          context: context,
          icon: ShellIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).collection,
          description: S.of(context).seaSaltPaperScoringCollections,
        ),
        InfoRowWidget(
          context: context,
          icon: PaletteIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).colorMajority,
          description: S.of(context).seaSaltPaperScoringColorMajority,
        ),
        InfoRowWidget(
          context: context,
          icon: CrownIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).mermaidVictory,
          description: S.of(context).seaSaltPaperScoringMermaid,
        ),
      ],
    );
  }
}
