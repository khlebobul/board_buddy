import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/config/utils/scrabble_letter_values.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:use_scramble/use_scramble.dart';

/// widget that represents a Scrabble word input interface.
class ScrabbleWordInputWidget extends StatefulWidget {
  final List<Player>? players;

  const ScrabbleWordInputWidget({
    super.key,
    this.players,
  });

  @override
  ScrabbleWordInputWidgetState createState() => ScrabbleWordInputWidgetState();
}

class ScrabbleWordInputWidgetState extends State<ScrabbleWordInputWidget> {
  List<String> letters = [];
  final TextEditingController _controller = TextEditingController();
  int _currentPlayerIndex = 0;
  final List<Map<String, dynamic>> _moveHistory = [];

  @override
  void initState() {
    super.initState();
    if (widget.players != null) {
      debugPrint(
          'Scrabble game started with ${widget.players!.length} players');
    }
  }

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

  void _nextPlayer() {
    if (widget.players == null || widget.players!.isEmpty) return;

    setState(() {
      _currentPlayerIndex = (_currentPlayerIndex + 1) % widget.players!.length;
      letters = [];
      _controller.clear();
    });
  }

  void _skipTurn() {
    HapticFeedback.mediumImpact();
    if (widget.players == null || widget.players!.isEmpty) return;

    final currentPlayer = widget.players![_currentPlayerIndex];

    setState(() {
      _moveHistory.add({
        'player': currentPlayer,
        'word': 'skipped',
        'score': 0,
      });
      _nextPlayer();
    });
  }

  // Make this method public so it can be called from outside
  void submitWord() {
    if (widget.players == null || widget.players!.isEmpty) return;
    if (_controller.text.trim().isEmpty) return;

    final currentPlayer = widget.players![_currentPlayerIndex];
    final word = _controller.text.trim();

    // Calculate score (simple implementation - just sum of letter values)
    int score = 0;
    for (var letter in word.split('')) {
      score += ScrabbleLetterValues.getLetterValue(letter);
    }

    setState(() {
      _moveHistory.add({
        'player': currentPlayer,
        'word': word,
        'score': score,
      });
      _nextPlayer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    // If no players, show a message
    if (widget.players == null || widget.players!.isEmpty) {
      return Center(
        child: Text(
          'no players added',
          style: theme.display2.copyWith(color: theme.secondaryTextColor),
        ),
      );
    }

    final currentPlayer = widget.players![_currentPlayerIndex];

    return Column(
      children: [
        // Move history
        if (_moveHistory.isNotEmpty) ...[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: theme.borderColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'move history',
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const SizedBox(height: 8),
                ..._moveHistory.reversed.take(5).map((move) {
                  final player = move['player'] as Player;
                  final word = move['word'] as String;
                  final score = move['score'] as int;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          player.name,
                          style:
                              theme.display6.copyWith(color: theme.textColor),
                        ),
                        Text(
                          word,
                          style:
                              theme.display6.copyWith(color: theme.textColor),
                        ),
                        Text(
                          '+$score',
                          style: theme.display6.copyWith(color: theme.redColor),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 15),
        ],

        // Current player and skip button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              currentPlayer.name,
              style: theme.display2.copyWith(color: theme.textColor),
            ),
            GestureDetector(
              onTap: _skipTurn,
              child: TextScramble(
                text: 'skip',
                style: theme.display2.copyWith(color: theme.redColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Word input
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
          onSubmitted: (_) => submitWord(),
        ),
        const SizedBox(height: 15),

        // Letter tiles
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
