import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/uno/widgets/info_uno_dialog_widget.dart';
import 'package:board_buddy/shared/widgets/ui/pressable.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:not_static_icons/not_static_icons.dart';
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
                    behavior: HitTestBehavior.opaque,
                    onTap: onLeftBtnTap,
                    child: TextScramble(
                        text: leftButtonText,
                        builder: (context, scrambledText) {
                          return Text(
                            scrambledText,
                            style:
                                theme.display2.copyWith(color: theme.textColor),
                          );
                        }),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onRightBtnTap,
                    child: TextScramble(
                        text: rightButtonText,
                        builder: (context, scrambledText) {
                          return Text(
                            scrambledText,
                            style: theme.display2.copyWith(
                                color: isRightBtnRed
                                    ? theme.redColor
                                    : theme.textColor),
                          );
                        }),
                  ),
                ],
              ),
            ],
            if (isArrow) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _BottomBarIconButton(
                    onTap: isLeftArrowActive ? onLeftArrowTap : null,
                    child: Undo2Icon(
                      size: 20,
                      strokeWidth: 1,
                      color: isLeftArrowActive
                          ? theme.textColor
                          : theme.secondaryTextColor,
                      hoverColor: theme.secondaryTextColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  dialogWidget == null
                      ? const SizedBox()
                      : _BottomBarIconButton(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return dialogWidget ?? const InfoUnoDialog();
                              },
                            );
                          },
                          child: CircleQuestionMarkIcon(
                            size: 20,
                            strokeWidth: 1,
                            color: theme.textColor,
                            hoverColor: theme.secondaryTextColor,
                          ),
                        ),
                  const SizedBox(width: 4),
                  _BottomBarIconButton(
                    onTap: isRightArrowActive ? onRightArrowTap : null,
                    child: Redo2Icon(
                      size: 20,
                      strokeWidth: 1,
                      color: isRightArrowActive
                          ? theme.textColor
                          : theme.secondaryTextColor,
                      hoverColor: theme.secondaryTextColor,
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

class _BottomBarIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;

  const _BottomBarIconButton({
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap == null
          ? null
          : () {
              onTap!();
              Gaimon.soft();
            },
      child: SizedBox(
        width: 44,
        height: 44,
        child: Center(
          child: IgnorePointer(child: child),
        ),
      ),
    );
  }
}
