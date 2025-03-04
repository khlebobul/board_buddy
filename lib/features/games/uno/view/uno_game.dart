import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/game_widgets/player_card.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_indicator.dart';
import 'package:board_buddy/features/games/uno/widgets/info_uno_dialog_widget.dart';
import 'package:board_buddy/features/games/uno/widgets/game_end_modal_widget.dart';
import 'package:board_buddy/shared/widgets/game_widgets/points_keyboard.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:flutter/material.dart';

/// uno game screen
class UnoGame extends StatefulWidget {
  final List<Player> players;
  final int scoreLimit;
  final String gameMode;

  const UnoGame({
    super.key,
    required this.players,
    required this.scoreLimit,
    required this.gameMode,
  });

  @override
  State<UnoGame> createState() => _UnoGameState();
}

class _UnoGameState extends State<UnoGame> with TickerProviderStateMixin {
  late final PageController _pageController;
  int _currentPage = 0;
  final List<int> _scoreHistory = [];
  final List<int> _redoStack = [];

  // Контроллер для анимации
  AnimationController? _animationController;
  Animation<double>? _animation;
  int _lastScoreChange = 0;
  bool _isScoreChanging = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController?.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final page = _pageController.page?.round() ?? 0;
    if (page != _currentPage) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _updateScore(int scoreChange) {
    setState(() {
      widget.players[_currentPage].score += scoreChange;
      _scoreHistory.add(scoreChange);
      _redoStack.clear(); // Clear redo stack on new action

      _showScoreChangeAnimation(scoreChange);

      // Check if any player has reached the score limit
      _checkGameEnd();
    });
  }

  void _checkGameEnd() {
    // Check if any player has reached the score limit
    bool gameEnded = false;

    if (widget.gameMode == S.of(context).highestScoreWins) {
      // In highest score wins mode, check if any player has reached or exceeded the score limit
      for (final player in widget.players) {
        if (player.score >= widget.scoreLimit) {
          gameEnded = true;
          break;
        }
      }
    } else if (widget.gameMode == S.of(context).lowestScoreWins) {
      // In lowest score wins mode, check if any player has reached or exceeded the score limit
      for (final player in widget.players) {
        if (player.score >= widget.scoreLimit) {
          gameEnded = true;
          break;
        }
      }
    }

    if (gameEnded) {
      // Show game end modal
      _showGameEndModal();
    }
  }

  void _showGameEndModal() {
    GameEndModalWidget.show(
      context,
      players: widget.players,
      gameMode: widget.gameMode,
      scoreLimit: widget.scoreLimit,
      onNewGameWithSamePlayers: _startNewGameWithSamePlayers,
      onNewGame: _startNewGame,
      onReturnToMenu: _returnToMenu,
    );
  }

  void _startNewGameWithSamePlayers() {
    // Reset scores for all players
    for (final player in widget.players) {
      player.score = 0;
    }

    // Reset game state
    setState(() {
      _scoreHistory.clear();
      _redoStack.clear();
      _currentPage = 0;
      _pageController.jumpToPage(0);
    });

    // Close the modal
    Navigator.pop(context);
  }

  void _startNewGame() {
    // Reset scores for all players before returning to the start screen
    for (final player in widget.players) {
      player.score = 0;
    }

    // Navigate back to the UNO start screen
    Navigator.pop(context); // Close modal
    Navigator.pop(context); // Return to start screen
  }

  void _returnToMenu() {
    // Reset scores for all players before returning to the menu
    for (final player in widget.players) {
      player.score = 0;
    }

    // Navigate back to the main menu
    Navigator.pop(context); // Close modal
    Navigator.pop(context); // Return to start screen
    Navigator.pop(context); // Return to main menu
  }

  void _showScoreChangeAnimation(int scoreChange) {
    _animationController?.dispose();

    _lastScoreChange = scoreChange;
    _isScoreChanging = true;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeOutQuad,
    );

    _animationController!.forward().then((_) {
      setState(() {
        _isScoreChanging = false;
      });
    });

    setState(() {});
  }

  void _undo() {
    if (_scoreHistory.isNotEmpty) {
      setState(() {
        final lastScoreChange = _scoreHistory.removeLast();
        widget.players[_currentPage].score -= lastScoreChange;
        _redoStack.add(lastScoreChange);

        _showScoreChangeAnimation(-lastScoreChange);
      });
    }
  }

  void _redo() {
    if (_redoStack.isNotEmpty) {
      setState(() {
        final lastUndoneScoreChange = _redoStack.removeLast();
        widget.players[_currentPage].score += lastUndoneScoreChange;
        _scoreHistory.add(lastUndoneScoreChange);

        _showScoreChangeAnimation(lastUndoneScoreChange);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        isRules: true,
        rightButtonText: S.of(context).rules,
        onRightButtonPressed: () => Navigator.pushNamed(context, '/unoRules'),
      ),
      body: SafeArea(
        // players cards
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: GeneralConst.paddingHorizontal),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${S.of(context).gameUpTo}${widget.scoreLimit}',
                        style: theme.display2
                            .copyWith(color: theme.secondaryTextColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: constraints.maxHeight * 0.4,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            PageView.builder(
                              controller: _pageController,
                              itemCount: widget.players.length,
                              pageSnapping: true,
                              padEnds: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        GeneralConst.paddingHorizontal / 2,
                                  ),
                                  child: PlayerCard(
                                    player: widget.players[index],
                                  ),
                                );
                              },
                            ),

                            // animation for score
                            if (_isScoreChanging && _animation != null)
                              AnimatedBuilder(
                                animation: _animation!,
                                builder: (context, child) {
                                  return Positioned(
                                    top: 60 - (_animation!.value * 40),
                                    left: 0,
                                    right: 0,
                                    child: Opacity(
                                      opacity: 1.0 - _animation!.value,
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          child: Text(
                                            _lastScoreChange > 0
                                                ? '+$_lastScoreChange'
                                                : '$_lastScoreChange',
                                            style: theme.display2.copyWith(
                                              color: theme.secondaryTextColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.players.asMap().entries.map((entry) {
                          final index = entry.key;
                          final player = entry.value;
                          final firstLetter = player.name.characters.first;
                          return GestureDetector(
                            onTap: () => _goToPage(index),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: PlayerIndicator(
                                letter: firstLetter,
                                isActive: index == _currentPage,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const Spacer(),

                // points keyboard
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: GeneralConst.paddingHorizontal),
                  child: CustomKeyboard(
                    buttons: [
                      [
                        KeyboardButton(
                          buttonText: '1',
                          onPressed: () => _updateScore(1),
                        ),
                        KeyboardButton(
                          buttonText: '2',
                          onPressed: () => _updateScore(2),
                        ),
                        KeyboardButton(
                          buttonText: '3',
                          onPressed: () => _updateScore(3),
                        ),
                        KeyboardButton(
                          buttonText: '4',
                          onPressed: () => _updateScore(4),
                        ),
                      ],
                      [
                        KeyboardButton(
                          buttonText: '5',
                          onPressed: () => _updateScore(5),
                        ),
                        KeyboardButton(
                          buttonText: '6',
                          onPressed: () => _updateScore(6),
                        ),
                        KeyboardButton(
                          buttonText: '7',
                          onPressed: () => _updateScore(7),
                        ),
                        KeyboardButton(
                          buttonText: '8',
                          onPressed: () => _updateScore(8),
                        ),
                      ],
                      [
                        KeyboardButton(
                          buttonText: '9',
                          onPressed: () => _updateScore(9),
                        ),
                        KeyboardButton(
                          buttonText: '0',
                          onPressed: () => _updateScore(0),
                        ),
                        KeyboardButton(
                          buttonText: '+2',
                          onPressed: () => _updateScore(20),
                        ),
                        KeyboardButton(
                          buttonIcon: CustomIcons.reverse,
                          onPressed: () => _updateScore(20),
                        ),
                      ],
                      [
                        KeyboardButton(
                          buttonIcon: CustomIcons.skip,
                          onPressed: () => _updateScore(20),
                        ),
                        KeyboardButton(
                          buttonIcon: CustomIcons.wild,
                          onPressed: () => _updateScore(50),
                        ),
                        KeyboardButton(
                          buttonIcon: CustomIcons.wildDrawFour,
                          onPressed: () => _updateScore(50),
                        ),
                        KeyboardButton(
                          buttonIcon: CustomIcons.swap,
                          onPressed: () => _updateScore(50),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomGameBar(
        dialogWidget: const InfoUnoDialog(),
        isArrow: true,
        rightButtonText: S.of(context).finish,
        onLeftArrowTap: _undo,
        onRightArrowTap: _redo,
        onRightBtnTap: _showGameEndModal,
      ),
    );
  }
}
