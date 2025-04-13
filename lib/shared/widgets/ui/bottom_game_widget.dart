import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/features/games/uno/widgets/info_uno_dialog_widget.dart';
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

  /// Flag to determine if the right button should be red.
  final bool isRightBtnRed;

  /// Flag to determine if the left arrow is active.
  final bool isLeftArrowActive;

  /// Flag to determine if the right arrow is active.
  final bool isRightArrowActive;

  /// Callback for keyboard button tap
  final VoidCallback? onKeyboardBtnTap;

  /// Flag to determine if the keyboard is active
  final bool isKeyboardActive;

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
    this.isRightBtnRed = false,
    this.isLeftArrowActive = true,
    this.isRightArrowActive = true,
    this.onKeyboardBtnTap,
    this.isKeyboardActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
                horizontal: GeneralConst.paddingHorizontal) +
            const EdgeInsets.only(bottom: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (rightButtonText.isNotEmpty) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onLeftBtnTap,
                    child: TextScramble(
                      text: leftButtonText,
                      style: theme.display2.copyWith(color: theme.textColor),
                    ),
                  ),
                  GestureDetector(
                    onTap: onRightBtnTap,
                    child: TextScramble(
                      text: rightButtonText,
                      style: theme.display2.copyWith(
                          color:
                              isRightBtnRed ? theme.redColor : theme.textColor),
                    ),
                  ),
                ],
              ),
            ],
            if (isArrow) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: isLeftArrowActive ? onLeftArrowTap : null,
                    child: SvgPicture.asset(
                      CustomIcons.leftArrow,
                      colorFilter: ColorFilter.mode(
                          isLeftArrowActive
                              ? theme.textColor
                              : theme.secondaryTextColor,
                          BlendMode.srcIn),
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
                            colorFilter: ColorFilter.mode(
                                theme.textColor, BlendMode.srcIn),
                            width: 20,
                          ),
                        ),
                  isKeyboardActive == false
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: onKeyboardBtnTap,
                          child: SvgPicture.asset(
                            CustomIcons.keyboard,
                            colorFilter: ColorFilter.mode(
                                theme.textColor, BlendMode.srcIn),
                            width: 20,
                          ),
                        ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: isRightArrowActive ? onRightArrowTap : null,
                    child: SvgPicture.asset(
                      CustomIcons.rightArrow,
                      colorFilter: ColorFilter.mode(
                          isRightArrowActive
                              ? theme.textColor
                              : theme.secondaryTextColor,
                          BlendMode.srcIn),
                      width: 20,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
