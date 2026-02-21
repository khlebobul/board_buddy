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
        // Number buttons explanation
        InfoRowWidget(
          context: context,
          cardName: '1-7',
          title: 'number buttons',
          description:
              'use for base cards (crab, boat, fish, shark, swimmer, sailor, captain, lighthouse) and their combinations.',
        ),
        // Collections
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
        // Color Majority
        InfoRowWidget(
          context: context,
          icon: PaletteIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: S.of(context).colorMajority,
          description:
              '${S.of(context).seaSaltPaperScoringColorMajority} opens dialog to enter the number of cards of your most common color.',
        ),
        // Mermaid
        InfoRowWidget(
          context: context,
          icon: CrownIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: 'mermaid victory',
          description: S.of(context).seaSaltPaperScoringMermaid,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Divider(
            color: theme.borderColor,
            height: 1,
          ),
        ),
        InfoRowWidget(
          context: context,
          icon: CrabIcon(
            strokeWidth: 1,
            size: 30,
            enableTouchInteraction: false,
            color: theme.textColor,
          ),
          title: 'duo cards rules',
          description: S.of(context).seaSaltPaperDuoCardsDescription,
        ),
      ],
    );
  }
}
