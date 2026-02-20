import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/info_row_widget.dart';
import 'package:board_buddy/shared/widgets/ui/blurred_dialog.dart';
import 'package:flutter/material.dart';

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
          title: 'Number Buttons',
          points: '+N',
          description: 'Use for base cards (Crab, Boat, Fish, Shark, Swimmer, Sailor, Captain, Lighthouse) and their combinations. Press the button matching your total points.',
        ),
        // Collections
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.collection,
          title: S.of(context).collection,
          points: '1-3-5-7-9-11',
          description: '${S.of(context).seaSaltPaperScoringCollections} Opens dialog to select: 1 card=1pt, 2=3pts, 3=5pts, 4=7pts, 5=9pts, 6=11pts.',
        ),
        // Color Majority
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.palette,
          title: S.of(context).colorMajority,
          points: '+N',
          description: '${S.of(context).seaSaltPaperScoringColorMajority} Opens dialog to enter the number of cards of your most common color.',
        ),
        // Mermaid
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.mermaid,
          title: 'Mermaid Victory',
          points: 'WIN',
          description: S.of(context).seaSaltPaperScoringMermaid,
        ),
        // Duo cards info
        InfoRowWidget(
          context: context,
          cardName: '${SeaSaltPaperEmoji.crab}${SeaSaltPaperEmoji.boat}',
          title: 'Duo Cards',
          description: '${S.of(context).seaSaltPaperDuoCardsDescription}\n\n${SeaSaltPaperEmoji.crab} Crab: ${S.of(context).seaSaltPaperDuoCrab}\n\n${SeaSaltPaperEmoji.boat} Boat: ${S.of(context).seaSaltPaperDuoBoat}\n\n${SeaSaltPaperEmoji.fish} Fish: ${S.of(context).seaSaltPaperDuoFish}\n\n${SeaSaltPaperEmoji.shark}${SeaSaltPaperEmoji.swimmer} Shark+Swimmer: ${S.of(context).seaSaltPaperDuoShark}',
        ),
      ],
    );
  }
}
