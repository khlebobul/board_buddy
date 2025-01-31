// ignore_for_file: deprecated_member_use

import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/custom_icons.dart';
import 'package:board_buddy/widgets/info_dialog_widgets/info_uno_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:use_scramble/use_scramble.dart';

class BottomGameBar extends StatelessWidget {
  final String leftButtonText;
  final String rightButtonText;
  final VoidCallback? onLeftBtnTap;
  final VoidCallback? onRightBtnTap;
  final bool isArrow;
  final VoidCallback? onLeftArrowTap;
  final VoidCallback? onRightArrowTap;
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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
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
            left: 0,
            child: GestureDetector(
              onTap: onLeftBtnTap,
              child: TextScramble(
                text: leftButtonText,
                style: theme.display2.copyWith(color: theme.textColor),
              ),
            ),
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
