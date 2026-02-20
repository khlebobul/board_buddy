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
        // Base cards (1 point each)
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.crab,
          title: 'Crab',
          points: '1',
          description: S.of(context).seaSaltPaperDuoCrab,
        ),
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.boat,
          title: 'Boat',
          points: '1',
          description: S.of(context).seaSaltPaperDuoBoat,
        ),
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.fish,
          title: 'Fish',
          points: '1',
          description: S.of(context).seaSaltPaperDuoFish,
        ),
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.shark,
          title: 'Shark + Swimmer',
          points: '1',
          description: S.of(context).seaSaltPaperDuoShark,
        ),
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.swimmer,
          title: 'Swimmer',
          points: '1',
          description: 'Works with Shark for duo effect',
        ),
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.sailor,
          title: 'Sailor',
          points: '1',
          description: '+1 point for each Sailor when you have a Captain',
        ),
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.captain,
          title: 'Captain',
          points: '1',
          description: 'Combo with Sailors: +1 per Sailor',
        ),
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.lighthouse,
          title: 'Lighthouse',
          points: '1',
          description: 'Combo with Boats: +1 per Boat',
        ),
        // Collections
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.collection,
          title: S.of(context).collection,
          points: '1-3-5-7-9-11',
          description: S.of(context).seaSaltPaperScoringCollections,
        ),
        // Color Majority
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.palette,
          title: S.of(context).colorMajority,
          points: '+N',
          description: S.of(context).seaSaltPaperScoringColorMajority,
        ),
        // Mermaid
        InfoRowWidget(
          context: context,
          cardName: SeaSaltPaperEmoji.mermaid,
          title: 'Mermaid',
          points: 'WIN',
          description: S.of(context).seaSaltPaperScoringMermaid,
        ),
      ],
    );
  }
}
