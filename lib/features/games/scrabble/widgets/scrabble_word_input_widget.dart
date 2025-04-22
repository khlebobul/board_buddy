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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:board_buddy/features/games/scrabble/bloc/scrabble_bloc.dart';

/// widget that represents a Scrabble word input interface.
class ScrabbleWordInputWidget extends StatefulWidget {
  final List<Player>? players;
  final int? currentPlayerIndex;
  final List<Map<String, dynamic>>? moveHistory;
  final Function(Player, String, int, Map<String, dynamic>?)? onSubmitWord;
  final Function(Player)? onSkipTurn;

  const ScrabbleWordInputWidget({
    super.key,
    this.players,
    this.currentPlayerIndex,
    this.moveHistory,
    this.onSubmitWord,
    this.onSkipTurn,
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

  // Method to update widget from bloc state
  void updateFromState(
      int currentPlayerIndex, List<Map<String, dynamic>> moveHistory) {
    setState(() {
      _currentPlayerIndex = currentPlayerIndex;

      // Clear and repopulate move history
      if (moveHistory.isNotEmpty) {
        _moveHistory.clear();
        _moveHistory.addAll(moveHistory);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    // Initialize with data from bloc if provided
    if (widget.moveHistory != null && widget.moveHistory!.isNotEmpty) {
      // Clear and add all items from widget.moveHistory
      _moveHistory.clear();
      _moveHistory.addAll(widget.moveHistory!);
    }

    if (widget.currentPlayerIndex != null) {
      _currentPlayerIndex = widget.currentPlayerIndex!;
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
      }
      // Handle letter modifiers
      else {
        _letterModifiers[letterIndex] = modifier;
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

    // Call the skip turn callback if provided
    if (widget.onSkipTurn != null) {
      widget.onSkipTurn!(currentPlayer);

      // Add skip to local move history immediately for display
      setState(() {
        _moveHistory.add({
          'player': currentPlayer,
          'word': S.current.skip,
          'score': 0,
        });
      });
    } else {
      // Default behavior if no callback
      setState(() {
        _moveHistory.add({
          'player': currentPlayer,
          'word': S.current.skip,
          'score': 0,
        });
        _nextPlayer();
      });
    }
  }

  // Calculate score with modifiers
  int _calculateScore(String word) {
    int score = 0;
    int wordMultiplier = 1;

    // Apply word modifier if exists
    if (_wordModifier != null) {
      if (_wordModifier!.contains(GameConst.scrabblex2)) {
        wordMultiplier = 2;
      } else if (_wordModifier!.contains(GameConst.scrabblex3)) {
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
        if (modifier == GameConst.scrabblex2) {
          letterValue *= 2;
        } else if (modifier == GameConst.scrabblex3) {
          letterValue *= 3;
        } else if (modifier == S.current.blankTile) {
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

    final word = _controller.text.trim();

    // Add validation for maximum word length (15 letters for standard Scrabble board)
    if (word.length > 15) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Word is too long. Maximum 15 letters allowed'),
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

    final currentPlayer = widget.players![_currentPlayerIndex];

    // Calculate score with modifiers
    final score = _calculateScore(word);

    // Create modifiers data
    final Map<String, dynamic> modifiersData = {
      'letter': Map<int, String>.from(_letterModifiers),
      'word': _wordModifier,
    };

    // Call the submit word callback if provided
    if (widget.onSubmitWord != null) {
      widget.onSubmitWord!(currentPlayer, word, score, modifiersData);

      // Add to local move history immediately for display purposes
      setState(() {
        _moveHistory.add({
          'player': currentPlayer,
          'word': word,
          'score': score,
          'modifiers': modifiersData,
        });
      });

      // Save game session after submitting a word
      context.read<ScrabbleBloc>().add(SaveGameSession());

      // Reset the input fields
      setState(() {
        letters = [];
        _controller.clear();
        _letterModifiers.clear();
        _wordModifier = null;
      });
    } else {
      // Default behavior if no callback
      setState(() {
        _moveHistory.add({
          'player': currentPlayer,
          'word': word,
          'score': score,
          'modifiers': modifiersData,
        });
        _nextPlayer();
      });
    }
  }

  // Add bingo bonus (50 points)
  void _addBingo() {
    HapticFeedback.mediumImpact();
    if (widget.players == null || widget.players!.isEmpty) return;

    final currentPlayer = widget.players![_currentPlayerIndex];

    // Record the bingo in move history
    // Call the submit word callback if provided
    if (widget.onSubmitWord != null) {
      widget.onSubmitWord!(currentPlayer, S.of(context).bingo, 50, null);

      // Add to local move history immediately for display purposes
      setState(() {
        _moveHistory.add({
          'player': currentPlayer,
          'word': S.of(context).bingo,
          'score': 50,
        });
      });

      // Save game session after submitting
      context.read<ScrabbleBloc>().add(SaveGameSession());
    } else {
      setState(() {
        _moveHistory.add({
          'player': currentPlayer,
          'word': S.of(context).bingo,
          'score': 50,
        });
        _nextPlayer();
      });
    }
  }

  // Helper method to render modifier indicator
  Widget _renderModifierIndicator(String modifier, UIThemes theme) {
    if (modifier == 'star') {
      return SvgPicture.asset(
        CustomIcons.star,
        width: 12,
        height: 12,
        colorFilter: ColorFilter.mode(theme.redColor, BlendMode.srcIn),
      );
    } else if (modifier == S.current.blankTile) {
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
    // if (widget.players == null || widget.players!.isEmpty) {
    //   return Center(
    //     child: Text(
    //       'no players added',
    //       style: theme.display2.copyWith(color: theme.secondaryTextColor),
    //     ),
    //   );
    // }

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
                  currentPlayer.name.toLowerCase(),
                  style: theme.display2.copyWith(color: theme.textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: _skipTurn,
                child: TextScramble(
                  text: S.current.skip,
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
            maxLength: 15,
            buildCounter: (context,
                    {required currentLength, required isFocused, maxLength}) =>
                null,
            decoration: InputDecoration(
              hintText: S.current.enterAWord,
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
          const SizedBox(height: 12),

          // Bingo button
          GestureDetector(
            onTap: _addBingo,
            child: TextScramble(
              text: S.of(context).bingo,
              style: theme.display2.copyWith(color: theme.redColor),
            ),
          ),
          const SizedBox(height: 8),

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
                    '${S.current.wordModifier}$_wordModifier',
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
          SizedBox(
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
                              () => _applyModifier(
                                  letter, index, GameConst.scrabblex2),
                            ),
                            _buildModifierButton(
                              Text(GameConst.scrabblex3, style: theme.display2),
                              () => _applyModifier(
                                  letter, index, GameConst.scrabblex3),
                            ),
                            _buildModifierButton(
                              SvgPicture.asset(
                                CustomIcons.star,
                                width: 24,
                                colorFilter: ColorFilter.mode(
                                    theme.textColor, BlendMode.srcIn),
                              ),
                              () => _applyModifier(letter, index, 'star'),
                            ),
                            _buildModifierButton(
                              Text('${GameConst.scrabblex2}${S.current.nWord}',
                                  style: theme.display7,
                                  textAlign: TextAlign.center),
                              () => _applyModifier(
                                  letter, index, S.current.x2Word),
                            ),
                            _buildModifierButton(
                              Text(
                                  '${GameConst.scrabblex3}${S.of(context).nWord}',
                                  style: theme.display7,
                                  textAlign: TextAlign.center),
                              () => _applyModifier(
                                  letter, index, S.of(context).x3Word),
                            ),
                            _buildModifierButton(
                              Text(S.of(context).blankTile,
                                  style: theme.display7,
                                  textAlign: TextAlign.center),
                              () => _applyModifier(
                                  letter, index, S.of(context).blankTile),
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
                    S.of(context).moveHistory,
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
                  }),
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
