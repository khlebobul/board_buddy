import 'package:board_buddy/utils/library.dart';

class CustomKeyboard extends StatelessWidget {
  final List<List<KeyboardButton>> buttons; // Список строк клавиш

  const CustomKeyboard({
    super.key,
    required this.buttons,
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
          childAspectRatio: 1.0,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: buttons.expand((row) => row).toList().length,
        itemBuilder: (context, index) {
          final flatButtons = buttons.expand((row) => row).toList();
          final button = flatButtons[index];
          return GestureDetector(
            onTap: button.onPressed,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
                color: button.backgroundColor ?? Colors.white,
              ),
              alignment: Alignment.center,
              child: button.child,
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
  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  KeyboardButton({
    required this.child,
    this.onPressed,
    this.backgroundColor,
  });
}
