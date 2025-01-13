// ignore_for_file: deprecated_member_use

import 'package:board_buddy/utils/library.dart';

class BottomGameBar extends StatelessWidget {
  final String leftButtonText;
  final String rightButtonText;
  final VoidCallback? onLeftBtnTap;
  final VoidCallback? onRightBtnTap;
  final bool isArrow;
  final VoidCallback? onLeftArrowTap;
  final VoidCallback? onRightArrowTap;

  const BottomGameBar({
    super.key,
    this.leftButtonText = '',
    this.rightButtonText = '',
    this.onLeftBtnTap,
    this.onRightBtnTap,
    this.isArrow = false,
    this.onLeftArrowTap,
    this.onRightArrowTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onLeftBtnTap,
            child: TextScramble(
              text: leftButtonText,
              style: theme.display2.copyWith(color: theme.textColor),
            ),
          ),
          if (isArrow)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: onLeftArrowTap,
                  child: SvgPicture.asset(
                    CustomIcons.leftArrow,
                    color: theme.textColor,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 16),
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
          GestureDetector(
            onTap: onRightBtnTap,
            child: TextScramble(
                text: rightButtonText,
                style: theme.display2.copyWith(color: theme.textColor)),
          ),
        ],
      ),
    );
  }
}
