import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/custom_icons.dart';
import 'package:board_buddy/widgets/info_dialog_widgets/info_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class InfoUnoFlipDialog extends StatelessWidget {
  const InfoUnoFlipDialog({super.key});

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
                  text: S.of(context).close.toLowerCase(),
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
              ),
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InfoRowWidget(
                    cardName: '+1',
                    title: 'draw one',
                    points: '10 points',
                    description: 'next player draws 1 card and skips turn.',
                  ),
                  InfoRowWidget(
                    iconPath: CustomIcons.reverse,
                    title: 'reverse',
                    points: '20 points',
                    description: 'reverses the direction of play.',
                  ),
                  InfoRowWidget(
                    iconPath: CustomIcons.skip,
                    title: 'skip',
                    points: '20 points',
                    description: 'next player skips their turn.',
                  ),
                  InfoRowWidget(
                    iconPath: CustomIcons.wild,
                    title: 'wild card',
                    points: '40 points',
                    description: 'player chooses the next color.',
                  ),
                  InfoRowWidget(
                    iconPath: CustomIcons.wildDrawTwoUnoflip,
                    title: 'wild draw two',
                    points: '50 points',
                    description: 'next player draws 2 cards and skips turn.',
                  ),
                  InfoRowWidget(
                    iconPath: CustomIcons.flip,
                    title: 'flip card',
                    points: '20 points',
                    description: 'flips all cards to the opposite side.',
                  ),
                  InfoRowWidget(
                    cardName: '+5',
                    title: 'draw five',
                    points: '40 points',
                    description: 'next player draws 5 cards and skips turn.',
                  ),
                  InfoRowWidget(
                    iconPath: CustomIcons.skipEveryone,
                    title: 'skip everyone card',
                    points: '30 points',
                    description:
                        'skips all players and returns turn to the original player.',
                  ),
                  InfoRowWidget(
                    iconPath: CustomIcons.wildDrawColor,
                    title: 'wild draw color',
                    points: '60 points',
                    description:
                        'next player draws until they get the chosen color.',
                  ),
                  InfoRowWidget(
                    title: 'number cards (1-9)',
                    points: '1-9 points',
                    description:
                        'each card has a number, determining its value.',
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
