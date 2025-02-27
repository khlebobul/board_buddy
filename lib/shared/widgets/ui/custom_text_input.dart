import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// widget that represents a custom text input field.
class CustomTextInput extends StatefulWidget {
  /// Hint text to display when the input is empty.
  final String hintText;

  /// Callback function to handle text changes.
  final ValueChanged<String>? onChanged;

  /// Keyboard type for the input field.
  final TextInputType keyboardType;

  const CustomTextInput({
    super.key,
    required this.hintText,
    this.onChanged,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  final TextEditingController _controller = TextEditingController();
  String _currentText = "";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentText = _controller.text;
      });
      if (widget.onChanged != null) {
        widget.onChanged!(_currentText);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            TextField(
              keyboardType: widget.keyboardType,
              cursorColor: theme.secondaryTextColor,
              controller: _controller,
              style: theme.display2,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle:
                    theme.display2.copyWith(color: theme.secondaryTextColor),
                border: InputBorder.none,
              ),
            ),
            Positioned(
              bottom: 8,
              left: -5,
              child: Container(
                height: 1,
                color: _currentText.isEmpty
                    ? theme.secondaryTextColor
                    : theme.textColor,
                width: _calculateUnderlineWidth(theme) + 10,
              ),
            ),
          ],
        ),
      ],
    );
  }

  double _calculateUnderlineWidth(UIThemes theme) {
    final String textToMeasure =
        _currentText.isEmpty ? widget.hintText : _currentText;

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: textToMeasure,
        style: theme.display2,
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.size.width;
  }
}
