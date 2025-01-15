import 'package:board_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:use_scramble/use_scramble.dart';

class ModalWindowWidget extends StatelessWidget {
  final String mainText;
  final String button1Text;
  final String button2Text;
  final VoidCallback button1Action;
  final VoidCallback button2Action;

  const ModalWindowWidget({
    super.key,
    required this.mainText,
    required this.button1Text,
    required this.button2Text,
    required this.button1Action,
    required this.button2Action,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: theme.bgColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: theme.secondaryTextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              mainText,
              style: theme.display2.copyWith(
                color: theme.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: button1Action,
                child: TextScramble(
                  text: button1Text,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
              ),
              GestureDetector(
                onTap: button2Action,
                child: TextScramble(
                  text: button2Text,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  static void show(
    BuildContext context, {
    required String mainText,
    required String button1Text,
    required String button2Text,
    required VoidCallback button1Action,
    required VoidCallback button2Action,
  }) {
    HapticFeedback.selectionClick();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ModalWindowWidget(
          mainText: mainText,
          button1Text: button1Text,
          button2Text: button2Text,
          button1Action: button1Action,
          button2Action: button2Action,
        );
      },
    );
  }
}
