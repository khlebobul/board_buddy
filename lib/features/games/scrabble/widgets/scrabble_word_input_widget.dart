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

  // Map to store letter modifiers
  final Map<int, String> _letterModifiers = {};
  // Word modifier for the current word
  String? _wordModifier;

  // Scroll controller for the main column
  final ScrollController _scrollController = ScrollController();

  // Getter for move history
  List<Map<String, dynamic>> get moveHistory => _moveHistory;

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
    _scrollController.dispose();
    super.dispose();
  }

  // Reset the game state
  void resetGame() {
    setState(() {
      letters = [];
      _controller.clear();
      _currentPlayerIndex = 0;
      _moveHistory.clear();
      _letterModifiers.clear();
      _wordModifier = null;
    });
  }

  void _updateLetters(String word) {
    final lowerCaseWord = word.toLowerCase();
    _controller.value = _controller.value.copyWith(
      text: lowerCaseWord,
      selection: TextSelection.collapsed(offset: lowerCaseWord.length),
    );
    setState(() {
      letters = lowerCaseWord.split('');
      // Clear modifiers if the word changes
      if (letters.length != _letterModifiers.length) {
        _letterModifiers.clear();
      }
    });
  }

  void _applyModifier(String letter, int letterIndex, String modifier) {
    HapticFeedback.selectionClick();
    setState(() {
      // Handle word modifiers
      if (modifier.contains('word')) {
        _wordModifier = modifier;
        debugPrint('Applied word modifier: $modifier');
      }
      // Handle letter modifiers
      else {
        _letterModifiers[letterIndex] = modifier;
        debugPrint('Applied $modifier to letter $letter at index $letterIndex');
      }
    });
  }

  void _nextPlayer() {
    if (widget.players == null || widget.players!.isEmpty) return;

    setState(() {
      _currentPlayerIndex = (_currentPlayerIndex + 1) % widget.players!.length;
      letters = [];
      _controller.clear();
      _letterModifiers.clear();
      _wordModifier = null;
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

  // Calculate score with modifiers
  int _calculateScore(String word) {
    int score = 0;
    int wordMultiplier = 1;

    // Apply word modifier if exists
    if (_wordModifier != null) {
      if (_wordModifier!.contains('x2')) {
        wordMultiplier = 2;
      } else if (_wordModifier!.contains('x3')) {
        wordMultiplier = 3;
      }
    }

    // Calculate score with letter modifiers
    for (int i = 0; i < word.length; i++) {
      String letter = word[i];
      int letterValue = ScrabbleLetterValues.getLetterValue(letter);

      // Apply letter modifier if exists
      if (_letterModifiers.containsKey(i)) {
        String modifier = _letterModifiers[i]!;
        if (modifier == 'x2') {
          letterValue *= 2;
        } else if (modifier == 'x3') {
          letterValue *= 3;
        } else if (modifier == 'blank tile') {
          letterValue = 0;
        }
      }

      score += letterValue;
    }

    // Apply word multiplier
    return score * wordMultiplier;
  }

  // Make this method public so it can be called from outside
  void submitWord() {
    if (widget.players == null || widget.players!.isEmpty) return;
    if (_controller.text.trim().isEmpty) return;

    final currentPlayer = widget.players![_currentPlayerIndex];
    final word = _controller.text.trim();

    // Calculate score with modifiers
    final score = _calculateScore(word);

    setState(() {
      _moveHistory.add({
        'player': currentPlayer,
        'word': word,
        'score': score,
        'modifiers': {
          'letter': Map<int, String>.from(_letterModifiers),
          'word': _wordModifier,
        },
      });
      _nextPlayer();
    });
  }

  // Helper method to render modifier indicator
  Widget _renderModifierIndicator(String modifier, UIThemes theme) {
    if (modifier == 'star') {
      return SvgPicture.asset(
        CustomIcons.star,
        width: 12,
        height: 12,
        // ignore: deprecated_member_use
        color: theme.redColor,
      );
    } else if (modifier == 'blank tile') {
      return Text(
        'b',
        style: theme.display7.copyWith(color: theme.redColor),
      );
    } else {
      return Text(
        modifier,
        style: theme.display7.copyWith(color: theme.redColor),
      );
    }
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

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          // Current player and skip button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  currentPlayer.name,
                  style: theme.display2.copyWith(color: theme.textColor),
                  overflow: TextOverflow.ellipsis,
                ),
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
              hintStyle:
                  theme.display2.copyWith(color: theme.secondaryTextColor),
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

          // Word modifier indicator
          if (_wordModifier != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: theme.fgColor,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: theme.borderColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'word modifier: $_wordModifier',
                    style: theme.display6.copyWith(color: theme.redColor),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _wordModifier = null;
                      });
                    },
                    child: Icon(
                      Icons.close,
                      size: 16,
                      color: theme.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],

          // Letter tiles - using Wrap instead of horizontal scroll
          Container(
            width: double.infinity,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: letters.asMap().entries.map((entry) {
                final int index = entry.key;
                final String letter = entry.value;

                // Check if this letter has a modifier
                final bool hasModifier = _letterModifiers.containsKey(index);
                final String? modifier = _letterModifiers[index];

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
                              () => _applyModifier(letter, index, 'x2'),
                            ),
                            _buildModifierButton(
                              Text(GameConst.scrabblex3, style: theme.display2),
                              () => _applyModifier(letter, index, 'x3'),
                            ),
                            _buildModifierButton(
                              SvgPicture.asset(
                                CustomIcons.star,
                                width: 24,
                                // ignore: deprecated_member_use
                                color: theme.textColor,
                              ),
                              () => _applyModifier(letter, index, 'star'),
                            ),
                            _buildModifierButton(
                              Text(
                                  '${GameConst.scrabblex2}${S.of(context).nWord}',
                                  style: theme.display7,
                                  textAlign: TextAlign.center),
                              () => _applyModifier(letter, index, 'x2 word'),
                            ),
                            _buildModifierButton(
                              Text(
                                  '${GameConst.scrabblex3}${S.of(context).nWord}',
                                  style: theme.display7,
                                  textAlign: TextAlign.center),
                              () => _applyModifier(letter, index, 'x3 word'),
                            ),
                            _buildModifierButton(
                              Text(S.of(context).blankTile,
                                  style: theme.display7,
                                  textAlign: TextAlign.center),
                              () => _applyModifier(letter, index, 'blank tile'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  child: Container(
                    width: 48, // Increased from 40 to 48
                    height: 48, // Increased from 40 to 48
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: hasModifier ? theme.redColor : theme.borderColor,
                        width: hasModifier ? 2 : 1,
                      ),
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
                            style:
                                theme.display7.copyWith(color: theme.redColor),
                          ),
                        ),
                        if (hasModifier) ...[
                          Positioned(
                            left: 2,
                            top: 2,
                            child: _renderModifierIndicator(modifier!, theme),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 15),

          // Move history - show all moves
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
                    style: theme.display2
                        .copyWith(color: theme.secondaryTextColor),
                  ),
                  const SizedBox(height: 8),
                  ..._moveHistory.reversed.map((move) {
                    final player = move['player'] as Player;
                    final word = move['word'] as String;
                    final score = move['score'] as int;

                    // Get first letter of player name
                    final firstLetter = player.name.isNotEmpty
                        ? player.name[0].toLowerCase()
                        : '';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            firstLetter,
                            style:
                                theme.display6.copyWith(color: theme.textColor),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                word,
                                style: theme.display6
                                    .copyWith(color: theme.textColor),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Text(
                            '+$score',
                            style:
                                theme.display6.copyWith(color: theme.redColor),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ],
      ),
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
