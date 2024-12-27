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
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onLeftButtonPressed,
            child: TextScramble(
              text: leftButtonText,
              style: textTheme.bodyLarge?.copyWith(color: AppColors.primary),
            ),
          ),
          GestureDetector(
            onTap: onRightButtonPressed,
            child: TextScramble(
              text: rightButtonText,
              style:
                  textTheme.bodyLarge?.copyWith(color: AppColors.secondaryText),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
