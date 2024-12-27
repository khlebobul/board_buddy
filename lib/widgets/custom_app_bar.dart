import '../library.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String leftButtonText;
  final VoidCallback onLeftButtonPressed;
  final String rightButtonText;
  final VoidCallback onRightButtonPressed;

  const CustomAppBar({
    super.key,
    required this.leftButtonText,
    required this.onLeftButtonPressed,
    required this.rightButtonText,
    required this.onRightButtonPressed,
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
                style: theme.display2.copyWith(color: theme.redColor),
              ),
            ),
            GestureDetector(
              onTap: onRightButtonPressed,
              child: TextScramble(
                text: rightButtonText,
                style: theme.display2.copyWith(color: theme.secondaryTextColor),
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
