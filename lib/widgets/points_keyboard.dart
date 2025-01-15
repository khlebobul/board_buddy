

import 'package:board_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomKeyboard extends StatelessWidget {
  final List<List<KeyboardButton>> buttons;
  final String buttonText;
  final String buttonIconPath;

  const CustomKeyboard({
    super.key,
    required this.buttons,
    this.buttonText = '',
    this.buttonIconPath = '',
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.borderColor, width: 1),
        borderRadius: BorderRadius.circular(8.0),
        color: theme.fgColor,
      ),
      child: Table(
        defaultColumnWidth: const FlexColumnWidth(),
        border: TableBorder.symmetric(
          inside: BorderSide(color: theme.borderColor, width: 1),
        ),
        children: buttons.map((row) => _buildTableRow(row, theme)).toList(),
      ),
    );
  }

  TableRow _buildTableRow(List<KeyboardButton> row, theme) {
    return TableRow(
      children: row.map((button) => _buildButtonCell(button, theme)).toList(),
    );
  }

  Widget _buildButtonCell(KeyboardButton button, theme) {
    return GestureDetector(
      onTap: button.onPressed,
      child: Container(
        margin: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: button.backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: button.buttonIcon.isEmpty
            ? Text(
                button.buttonText,
                style: theme.display1.copyWith(
                  color: theme.textColor,
                ),
              )
            : SizedBox(
                width: button.iconSize,
                height: button.iconSize,
                child: SvgPicture.asset(
                  button.buttonIcon,
                  fit: BoxFit.contain,
                  // ignore: deprecated_member_use
                  color: theme.textColor,
                ),
              ),
      ),
    );
  }
}

class KeyboardButton {
  final String buttonIcon;
  final String buttonText;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double iconSize;

  KeyboardButton({
    this.buttonIcon = '',
    this.buttonText = '',
    this.onPressed,
    this.backgroundColor,
    this.iconSize = 27.0,
  });
}
