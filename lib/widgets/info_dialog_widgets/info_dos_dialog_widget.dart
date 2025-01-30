import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/custom_icons.dart';
import 'package:board_buddy/widgets/info_dialog_widgets/info_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class InfoDosDialog extends StatelessWidget {
  const InfoDosDialog({super.key});

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
                    iconPath: CustomIcons.wildDrawTwoDos,
                    title: 'wild draw two card',
                    points: '20 points',
                    description:
                        'can be any color chosen by the current player. if drawn, the player decides the color.',
                  ),
                  InfoRowWidget(
                    cardName: ' #',
                    title: 'wild # card',
                    points: '50 points',
                    description:
                        'can represent any number for its own particular color.',
                  ),
                  InfoRowWidget(
                    title: 'number cards (1-10)',
                    points: '1-10 points',
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
