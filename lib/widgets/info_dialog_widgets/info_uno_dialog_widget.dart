import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/custom_icons.dart';
import 'package:board_buddy/widgets/info_dialog_widgets/info_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class InfoUnoDialog extends StatelessWidget {
  const InfoUnoDialog({super.key});

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
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InfoRowWidget(
                    iconPath: CustomIcons.reverse,
                    title: 'reverse card',
                    points: '20 points',
                    description: 'changes the direction of play.',
                  ),
                  InfoRowWidget(
                    iconPath: CustomIcons.skip,
                    title: 'skip card',
                    points: '20 points',
                    description: 'skips the next player\'s turn.',
                  ),
                  InfoRowWidget(
                    cardName: '+2',
                    title: 'draw two card',
                    points: '20 points',
                    description:
                        'next player draws two cards and loses their turn.',
                  ),
                  InfoRowWidget(
                    iconPath: CustomIcons.wild,
                    title: 'wild card',
                    points: '50 points',
                    description: 'allows the player to choose the color.',
                  ),
                  InfoRowWidget(
                    iconPath: CustomIcons.wildDrawFour,
                    title: 'wild draw four card',
                    points: '50 points',
                    description:
                        'changes the color and forces the next player to draw four cards.',
                  ),
                  InfoRowWidget(
                    iconPath: CustomIcons.swap,
                    title: 'wild shuffle hands card',
                    points: '50 points',
                    description:
                        'swap hands with any player and choose the color.',
                  ),
                  InfoRowWidget(
                    title: 'number cards',
                    points: '0-9 points',
                    description:
                        'each card has a number from 0 to 9, which determines its value.',
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
