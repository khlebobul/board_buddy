import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

/// widget that represents a customizable app bar.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Text for the left button.
  final String leftButtonText;

  /// Callback for left button press.
  final VoidCallback onLeftButtonPressed;

  /// Text for the right button.
  final String rightButtonText;

  /// Callback for right button press.
  final VoidCallback onRightButtonPressed;

  /// Flag to determine if the right button is for rules.
  final bool isRules;

  const CustomAppBar({
    super.key,
    required this.leftButtonText,
    required this.onLeftButtonPressed,
    required this.rightButtonText,
    required this.onRightButtonPressed,
    this.isRules = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: theme.bgColor,
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onLeftButtonPressed,
              child: TextScramble(
                  text: leftButtonText,
                  builder: (context, scrambledText) {
                    return Text(
                      scrambledText,
                      style: theme.display2.copyWith(color: theme.redColor),
                    );
                  }),
            ),
            GestureDetector(
              onTap: onRightButtonPressed,
              child: isRules
                  ? TextScramble(
                      text: rightButtonText,
                      builder: (context, scrambledText) {
                        return Text(
                          scrambledText,
                          style: theme.display2.copyWith(color: theme.redColor),
                        );
                      })
                  : Text(
                      rightButtonText,
                      style: theme.display2
                          .copyWith(color: theme.secondaryTextColor),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
