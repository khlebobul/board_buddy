import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ScrabbleWordInputWidget extends StatefulWidget {
  const ScrabbleWordInputWidget({super.key});

  @override
  State<ScrabbleWordInputWidget> createState() =>
      _ScrabbleWordInputWidgetState();
}

class _ScrabbleWordInputWidgetState extends State<ScrabbleWordInputWidget> {
  List<String> letters = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateLetters(String word) {
    final lowerCaseWord = word.toLowerCase();
    _controller.value = _controller.value.copyWith(
      text: lowerCaseWord,
      selection: TextSelection.collapsed(offset: lowerCaseWord.length),
    );
    setState(() {
      letters = lowerCaseWord.split('');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Column(
      children: [
        TextField(
          controller: _controller,
          textCapitalization: TextCapitalization.none,
          keyboardType: TextInputType.text,
          cursorColor: theme.secondaryTextColor,
          style: theme.display2.copyWith(color: theme.textColor),
          decoration: InputDecoration(
            hintText: S.of(context).enterAWord,
            hintStyle: theme.display2.copyWith(color: theme.secondaryTextColor),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: theme.borderColor, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.borderColor, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.textColor, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          textAlign: TextAlign.center,
          onChanged: _updateLetters,
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: letters.map((letter) {
              return Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: theme.borderColor, width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: theme.fgColor,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        letter,
                        style: theme.display2.copyWith(
                          color: theme.textColor,
                        ),
                      ),
                    ),
                    // TODO points for each letter
                    Positioned(
                      right: 2,
                      bottom: 2,
                      child: Text(
                        '1',
                        style: theme.display7.copyWith(color: theme.redColor),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
