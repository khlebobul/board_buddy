import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/app_constants.dart';
import 'package:board_buddy/utils/custom_icons.dart';
import 'package:board_buddy/widgets/info_dialog_widgets/info_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class InfoscrabbleDialog extends StatelessWidget {
  const InfoscrabbleDialog({super.key});

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
                    cardName: scrabblex2,
                    title: '',
                    description: 'doubles the value of a letter',
                  ),
                  InfoRowWidget(
                    cardName: scrabblex3,
                    description: 'triple the value of a letter',
                  ),
                  InfoRowWidget(
                    iconPath: CustomIcons.star,
                    description: 'bonus tile or special marker',
                  ),
                  InfoRowWidget(
                    isScrabble: true,
                    cardName: '$scrabblex2\nword',
                    description: 'doubles the value of an entire word',
                  ),
                  InfoRowWidget(
                    isScrabble: true,
                    cardName: '$scrabblex3\nword',
                    description: 'triple the value of an entire word',
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
