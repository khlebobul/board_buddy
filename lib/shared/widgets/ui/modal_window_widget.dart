import 'dart:ui';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
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
                behavior: HitTestBehavior.opaque,
                onTap: button1Action,
                child: TextScramble(
                    text: button1Text,
                    builder: (context, scrambledText) {
                      return Text(
                        scrambledText,
                        style: theme.display2.copyWith(color: theme.redColor),
                      );
                    }),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: button2Action,
                child: TextScramble(
                    text: button2Text,
                    builder: (context, scrambledText) {
                      return Text(
                        scrambledText,
                        style: theme.display2.copyWith(color: theme.redColor),
                      );
                    }),
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

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.2),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                color: Colors.black.withValues(alpha: 0),
              ),
            ),
            Center(
              child: ModalWindowWidget(
                mainText: mainText,
                button1Text: button1Text,
                button2Text: button2Text,
                button1Action: button1Action,
                button2Action: button2Action,
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1,
          child: child,
        );
      },
    );
  }

  static void showContinueGameDialog(
    BuildContext context, {
    required VoidCallback onNewGame,
    required VoidCallback onContinue,
  }) {
    show(
      context,
      mainText: S.of(context).youHaveAnUnfinishedGame,
      button1Text: S.of(context).newGame,
      button2Text: S.of(context).continueTitle,
      button1Action: () {
        onNewGame();
        Navigator.pop(context);
      },
      button2Action: () {
        onContinue();
        Navigator.pop(context);
      },
    );
  }
}
