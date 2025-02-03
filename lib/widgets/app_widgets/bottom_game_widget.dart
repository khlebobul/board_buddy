// ignore_for_file: deprecated_member_use

import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/custom_icons.dart';
import 'package:board_buddy/widgets/info_dialog_widgets/info_uno_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:use_scramble/use_scramble.dart';

/// widget that represents a customizable bottom game bar.
class BottomGameBar extends StatelessWidget {
  /// Text for the left button.
  final String leftButtonText;

  /// Text for the right button.
  final String rightButtonText;

  /// Callback for left button tap.
  final VoidCallback? onLeftBtnTap;

  /// Callback for right button tap.
  final VoidCallback? onRightBtnTap;

  /// Flag to determine if arrows should be displayed.
  final bool isArrow;

  /// Callback for left arrow tap.
  final VoidCallback? onLeftArrowTap;

  /// Callback for right arrow tap.
  final VoidCallback? onRightArrowTap;

  /// Widget to display in the dialog.
  final Widget? dialogWidget;

  const BottomGameBar({
    super.key,
    this.leftButtonText = '',
    this.rightButtonText = '',
    this.onLeftBtnTap,
    this.onRightBtnTap,
    this.isArrow = false,
    this.onLeftArrowTap,
    this.onRightArrowTap,
    this.dialogWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16) +
          const EdgeInsets.only(bottom: 30),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isArrow)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onLeftArrowTap,
                  child: SvgPicture.asset(
                    CustomIcons.leftArrow,
                    color: theme.textColor,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 20),
                dialogWidget == null
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return dialogWidget ?? const InfoUnoDialog();
                            },
                          );
                        },
                        child: SvgPicture.asset(
                          CustomIcons.info,
                          color: theme.textColor,
                          width: 20,
                        ),
                      ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: onRightArrowTap,
                  child: SvgPicture.asset(
                    CustomIcons.rightArrow,
                    color: theme.textColor,
                    width: 20,
                  ),
                ),
              ],
            ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: onRightBtnTap,
              child: TextScramble(
                text: rightButtonText,
                style: theme.display2.copyWith(color: theme.textColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
