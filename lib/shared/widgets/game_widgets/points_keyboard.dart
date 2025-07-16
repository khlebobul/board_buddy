import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaimon/gaimon.dart';

/// widget that represents a custom keyboard.
class CustomKeyboard extends StatelessWidget {
  /// A list of button rows, each containing a list of [KeyboardButton]s.
  final List<List<KeyboardButton>> buttons;

  /// Text to display on the button.
  final String buttonText;

  /// Path to the icon to display on the button.
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
        border: Border.all(color: theme.borderColor, width: 1),
        borderRadius: BorderRadius.circular(8.0),
        color: theme.fgColor,
      ),
      child: Table(
        defaultColumnWidth: const FlexColumnWidth(),
        border: TableBorder.symmetric(
          inside: BorderSide(color: theme.borderColor, width: 1),
        ),
        children: buttons.map((row) => _buildTableRow(row, theme)).toList(),
      ),
    );
  }

  TableRow _buildTableRow(List<KeyboardButton> row, theme) {
    return TableRow(
      children: row
          .map((button) => _AnimatedButtonCell(button: button, theme: theme))
          .toList(),
    );
  }
}

class _AnimatedButtonCell extends StatefulWidget {
  final KeyboardButton button;
  final dynamic theme;

  const _AnimatedButtonCell({required this.button, required this.theme});

  @override
  __AnimatedButtonCellState createState() => __AnimatedButtonCellState();
}

class __AnimatedButtonCellState extends State<_AnimatedButtonCell>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    // animate color
    _colorAnimation = ColorTween(
      begin: widget.theme.textColor,
      end: widget.theme.secondaryTextColor,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (widget.button.onPressed != null) {
      widget.button.onPressed!();
      Gaimon.soft();
      _controller.forward().then((_) => _controller.reverse());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        margin: widget.button.useCompactMargin
            ? const EdgeInsets.all(7.0)
            : const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: widget.button.backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return widget.button.buttonIcon.isEmpty
                ? Text(
                    widget.button.buttonText,
                    style: widget.theme.display8
                        .copyWith(color: _colorAnimation.value),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: SizedBox(
                      width: widget.button.iconSize,
                      height: widget.button.iconSize,
                      child: SvgPicture.asset(
                        widget.button.buttonIcon,
                        fit: BoxFit.fitHeight,
                        colorFilter: ColorFilter.mode(
                            _colorAnimation.value!, BlendMode.srcIn),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}

/// class representing a button on the custom keyboard.
class KeyboardButton {
  /// Path to the icon to display on the button.
  final String buttonIcon;

  /// Text to display on the button.
  final String buttonText;

  /// Callback function to execute when the button is pressed.
  final VoidCallback? onPressed;

  /// Background color of the button.
  final Color? backgroundColor;

  /// Size of the icon on the button.
  final double iconSize;

  /// Whether to use a compact margin
  final bool useCompactMargin;

  KeyboardButton({
    this.buttonIcon = '',
    this.buttonText = '',
    this.onPressed,
    this.backgroundColor,
    this.iconSize = 30.0,
    this.useCompactMargin = false,
  });
}
