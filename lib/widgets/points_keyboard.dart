import 'package:board_buddy/utils/library.dart';

class CustomKeyboard extends StatelessWidget {
  final List<List<KeyboardButton>> buttons;
  final String buttonText;
  final String buttonIconPath;

  const CustomKeyboard({
    super.key,
    required this.buttons,
    this.buttonText = '',
    this.buttonIconPath = '',
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.borderColor, width: 2),
        borderRadius: BorderRadius.circular(8.0),
        color: theme.fgColor,
      ),
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _calculateMaxColumns(),
          //childAspectRatio: 1.0,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: buttons.expand((row) => row).toList().length,
        itemBuilder: (context, index) {
          final flatButtons = buttons.expand((row) => row).toList();
          final button = flatButtons[index];
          return GestureDetector(
            onTap: button.onPressed,
            child: button.buttonIcon.isEmpty
                ? Text(
                    button.buttonText,
                    style: theme.display2.copyWith(
                      color: theme.textColor,
                    ),
                  )
                : SizedBox(
                    width: button.iconSize,
                    height: button.iconSize,
                    child: SvgPicture.asset(
                      button.buttonIcon,
                      fit: BoxFit.contain,
                      color: theme.textColor,
                    ),
                  ),
          );
        },
      ),
    );
  }

  int _calculateMaxColumns() {
    return buttons.isNotEmpty ? buttons.first.length : 1;
  }
}

class KeyboardButton {
  final String buttonIcon;
  final String buttonText;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double iconSize;

  KeyboardButton({
    this.buttonIcon = '',
    this.buttonText = '',
    this.onPressed,
    this.backgroundColor,
    this.iconSize = 27.0,
  });
}
