import 'package:board_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PlayerIndicator extends StatelessWidget {
  final String letter;
  final bool isActive;

  const PlayerIndicator({
    required this.letter,
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Center(
      child: Text(
        letter.toLowerCase(),
        style: theme.display6.copyWith(
          color: isActive ? theme.textColor : theme.secondaryTextColor,
          letterSpacing: 5.0,
        ),
      ),
    );
  }
}
