import 'package:board_buddy/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// widget that represents a player indicator with a letter.
class PlayerIndicator extends StatelessWidget {
  /// The letter to display as the player indicator.
  final String letter;

  /// Flag to determine if the indicator is active.
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
