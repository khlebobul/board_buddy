import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/game_widgets/points_keyboard.dart';
import 'package:flutter/material.dart';

class UnoZeroKeyboard extends StatelessWidget {
  final ValueChanged<String> onDigit;
  final VoidCallback onBackspace;
  final VoidCallback onConfirm;

  const UnoZeroKeyboard({
    super.key,
    required this.onDigit,
    required this.onBackspace,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    KeyboardButton digit(String value) {
      return KeyboardButton(
        buttonText: value,
        useCompactMargin: true,
        onPressed: () => onDigit(value),
      );
    }

    return CustomKeyboard(
      buttons: [
        [digit('1'), digit('2'), digit('3')],
        [digit('4'), digit('5'), digit('6')],
        [digit('7'), digit('8'), digit('9')],
        [
          digit('0'),
          KeyboardButton(
            buttonText: '←',
            useCompactMargin: true,
            onPressed: onBackspace,
          ),
          KeyboardButton(
            buttonText: S.of(context).unoZeroOk,
            useCompactMargin: true,
            onPressed: onConfirm,
          ),
        ],
      ],
    );
  }
}
