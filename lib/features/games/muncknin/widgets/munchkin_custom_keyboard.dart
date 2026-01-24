import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:not_static_icons/not_static_icons.dart';

/// A custom keyboard widget for Munchkin one-time modifiers.
/// Provides quick access to common modifier values (+2, +3, +5, +10) and a clear button.
class MunchkinCustomKeyboard extends StatelessWidget {
  /// Callback function when a modifier button is pressed, providing the modifier value.
  final Function(int) onModifierSelected;

  /// Callback function when the clear button is pressed.
  final VoidCallback onClear;

  /// Current accumulated modifier value to display
  final int currentModifier;

  const MunchkinCustomKeyboard({
    required this.onModifierSelected,
    required this.onClear,
    this.currentModifier = 0,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 45,
            child: Row(
              children: [
                _buildModifierButton(
                  value: 2,
                  displayText: '+2',
                  theme: theme,
                  context: context,
                ),
                _buildModifierButton(
                  value: 3,
                  displayText: '+3',
                  theme: theme,
                  context: context,
                ),
                _buildModifierButton(
                  value: 5,
                  displayText: '+5',
                  theme: theme,
                  context: context,
                ),
                _buildModifierButton(
                  value: 10,
                  displayText: '+10',
                  theme: theme,
                  context: context,
                ),
                _buildClearButton(theme: theme, context: context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModifierButton({
    required int value,
    required String displayText,
    required UIThemes theme,
    required BuildContext context,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: theme.borderColor, width: 1),
          ),
        ),
        child: _buildButton(
          onTap: () {
            onModifierSelected(value);
            Gaimon.soft();
          },
          displayText: displayText,
          theme: theme,
          textColor: theme.textColor,
        ),
      ),
    );
  }

  Widget _buildClearButton({
    required UIThemes theme,
    required BuildContext context,
  }) {
    return Expanded(
      child: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: TrashIcon(
          color: theme.textColor,
          size: 24,
          strokeWidth: 1,
          hoverColor: theme.secondaryTextColor,
          onTap: onClear,
        ),
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback onTap,
    required String displayText,
    required UIThemes theme,
    Color? textColor,
    Widget? icon,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: icon ??
            Text(
              displayText,
              style: theme.display8.copyWith(
                color: textColor ?? theme.textColor,
              ),
            ),
      ),
    );
  }
}
