import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// A custom keyboard widget for score adjustments in the Common Counter game.
class CustomScoreKeyboard extends StatelessWidget {
  /// Callback function when a button is pressed, providing the score change value.
  final Function(int) onValueSelected;

  /// Whether to show the compact version with only one row of buttons.
  final bool isCompact;

  const CustomScoreKeyboard({
    required this.onValueSelected,
    this.isCompact = false,
    super.key,
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
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: theme.borderColor, width: 1),
              ),
            ),
            child: Center(
              child: _buildButton(
                value: 1,
                displayText: '+1',
                theme: theme,
                height: 80,
              ),
            ),
          ),

          // Bottom row with -100, -10, -1, +10, +100
          if (!isCompact)
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  _buildScoreButton(value: -100, theme: theme),
                  _buildScoreButton(value: -10, theme: theme),
                  _buildScoreButton(value: -1, theme: theme),
                  _buildScoreButton(
                      value: 10, displayText: '+10', theme: theme),
                  _buildScoreButton(
                      value: 100,
                      displayText: '+100',
                      theme: theme,
                      isLast: true),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildScoreButton({
    required int value,
    String? displayText,
    required UIThemes theme,
    bool isLast = false,
  }) {
    return Expanded(
      child: Container(
        child: _buildButton(
          value: value,
          displayText: displayText ?? value.toString(),
          theme: theme,
        ),
      ),
    );
  }

  Widget _buildButton({
    required int value,
    required String displayText,
    required UIThemes theme,
    double height = double.infinity,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onValueSelected(value),
      child: Container(
        height: height,
        alignment: Alignment.center,
        child: Text(
          displayText,
          style: theme.display8.copyWith(color: theme.textColor),
        ),
      ),
    );
  }
}
