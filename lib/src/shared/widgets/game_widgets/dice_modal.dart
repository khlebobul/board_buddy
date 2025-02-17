import 'dart:math';

import 'package:board_buddy/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// widget that represents a dice modal dialog.
class DiceModal extends StatelessWidget {
  /// The number on the dice to display.
  final int diceNumber;

  const DiceModal({required this.diceNumber, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Dialog(
      backgroundColor: theme.bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              theme.isDarkTheme
                  ? 'assets/images/dice/dice_dark_$diceNumber.png'
                  : 'assets/images/dice/dice_light_$diceNumber.png',
              width: 300,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }

  static void show(BuildContext context) {
    final randomDice = (1 + Random().nextInt(6));

    HapticFeedback.selectionClick();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DiceModal(diceNumber: randomDice);
      },
    );
  }
}
