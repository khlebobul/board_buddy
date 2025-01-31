import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/app_constants.dart';
import 'package:board_buddy/utils/custom_icons.dart';
import 'package:board_buddy/utils/scrabble_letter_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_popup/flutter_popup.dart';

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

  void _applyModifier(String letter, String modifier) {
    debugPrint('Applied $modifier to letter $letter');
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
              return CustomPopup(
                showArrow: true,
                arrowColor: theme.fgColor,
                backgroundColor: theme.fgColor,
                content: Container(
                  width: 300,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildModifierButton(
                            Text(GameConst.scrabblex2, style: theme.display2),
                            () => _applyModifier(letter, 'x2'),
                          ),
                          _buildModifierButton(
                            Text(GameConst.scrabblex3, style: theme.display2),
                            () => _applyModifier(letter, 'x3'),
                          ),
                          _buildModifierButton(
                            SvgPicture.asset(
                              CustomIcons.star,
                              width: 24,
                              // ignore: deprecated_member_use
                              color: theme.textColor,
                            ),
                            () => _applyModifier(letter, 'x2'),
                          ),
                          _buildModifierButton(
                            Text(
                                '${GameConst.scrabblex2}${S.of(context).nWord}',
                                style: theme.display7,
                                textAlign: TextAlign.center),
                            () => _applyModifier(letter, 'x2'),
                          ),
                          _buildModifierButton(
                            Text(
                                '${GameConst.scrabblex3}${S.of(context).nWord}',
                                style: theme.display7,
                                textAlign: TextAlign.center),
                            () => _applyModifier(letter, 'x3'),
                          ),
                          _buildModifierButton(
                            Text(S.of(context).blankTile,
                                style: theme.display7,
                                textAlign: TextAlign.center),
                            () => _applyModifier(letter, 'blank tile'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                child: Container(
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
                      Positioned(
                        right: 2,
                        bottom: 2,
                        child: Text(
                          ScrabbleLetterValues.getLetterValue(letter)
                              .toString(),
                          style: theme.display7.copyWith(color: theme.redColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

Widget _buildModifierButton(
  Widget child,
  VoidCallback onPressed,
) {
  return InkWell(
    onTap: onPressed,
    child: child,
  );
}
