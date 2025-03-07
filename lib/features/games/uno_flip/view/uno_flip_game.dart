import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/features/games/uno_flip/bloc/uno_flip_bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/game_widgets/game_end_uno_modal_widget.dart';
import 'package:board_buddy/shared/widgets/game_widgets/player_card.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_indicator.dart';
import 'package:board_buddy/shared/widgets/game_widgets/points_keyboard.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/features/games/uno_flip/widgets/info_uno_flip_dialog_widget.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// uno flip game screen
class UnoFlipGame extends StatefulWidget {
  final List<Player> players;
  final int scoreLimit;
  final String gameMode;

  const UnoFlipGame({
    super.key,
    required this.players,
    required this.scoreLimit,
    required this.gameMode,
  });

  @override
  State<UnoFlipGame> createState() => _UnoFlipGameState();
}

class _UnoFlipGameState extends State<UnoFlipGame>
    with TickerProviderStateMixin {
  late final PageController _pageController;
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  late UnoFlipBloc bloc;
  bool _isDarkSide = false;

  // Local state to track current page
  int _currentPageIndex = 0;
  bool _isInitialized = false;
  bool _isGameEndModalShown = false;

  @override
  void initState() {
    super.initState();

    // Initialize PageController with initial page 0
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutQuad,
    );

    // Initialize the game in the BLoC
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isInitialized) {
        bloc = context.read<UnoFlipBloc>();
        bloc.add(InitializeUnoFlipGame(
          players: widget.players,
          scoreLimit: widget.scoreLimit,
          gameMode: widget.gameMode,
        ));
        _isInitialized = true;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _updateScore(int scoreChange) {
    bloc.updateScore(scoreChange);
    _animationController.reset();
    _animationController.forward().then((_) {
      bloc.resetScoreAnimation();
    });
  }

  void _showGameEndModal(
      List<Player> players, String gameMode, int scoreLimit) {
    // Check if modal is already shown
    if (_isGameEndModalShown) return;

    // Set flag that modal is shown
    _isGameEndModalShown = true;

    GameEndUnoModalWidget.show(
      context,
      players: players,
      gameMode: gameMode,
      scoreLimit: scoreLimit,
      onNewGameWithSamePlayers: () {
        bloc.startNewGameWithSamePlayers();
        Navigator.pop(context);
        // Reset flag after closing modal
        _isGameEndModalShown = false;
      },
      onNewGame: () {
        bloc.startNewGame();
        Navigator.pop(context); // Close modal
        Navigator.pop(context); // Return to start screen
        // Reset the flag after closing the modal window
        _isGameEndModalShown = false;
      },
      onReturnToMenu: () {
        bloc.returnToMenu();
        Navigator.pushNamed(context, '/home');
        // Reset the flag after closing the modal window
        _isGameEndModalShown = false;
      },
    );
  }

  void _showEndGameModalWithoutScoreLimit() {
    ModalWindowWidget.show(
      context,
      mainText: S.of(context).youHaveAnUnfinishedGame,
      button1Text: S.of(context).doReturn,
      button2Text: S.of(context).finish,
      button1Action: () => Navigator.pop(context),
      button2Action: () {
        bloc.returnToMenu();
        Navigator.pushNamed(context, '/home');
      },
    );
  }

  void _undo() {
    bloc.undo();
    _animationController.reset();
    _animationController.forward().then((_) {
      bloc.resetScoreAnimation();
    });
  }

  void _redo() {
    bloc.redo();
    _animationController.reset();
    _animationController.forward().then((_) {
      bloc.resetScoreAnimation();
    });
  }

  void _toggleSide() {
    setState(() {
      _isDarkSide = !_isDarkSide;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlocConsumer<UnoFlipBloc, UnoFlipState>(
      listenWhen: (previous, current) {
        // Listen only to UnoFlipGameState changes
        if (current is UnoFlipGameState && previous is UnoFlipGameState) {
          // If previous state already had gameEnded = true, don't trigger listener
          if (previous.gameEnded && current.gameEnded) {
            return false;
          }
        }
        return current is UnoFlipGameState;
      },
      listener: (context, state) {
        if (state is UnoFlipGameState) {
          // If current player index in BLoC differs from current page,
          // and this is not caused by our own page change,
          // then navigate to the needed page
          if (state.currentPlayerIndex != _currentPageIndex) {
            _pageController.animateToPage(
              state.currentPlayerIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }

          // Show game end modal if game ended
          if (state.gameEnded && !_isGameEndModalShown) {
            _showGameEndModal(state.players, state.gameMode, state.scoreLimit);
          }
        }
      },
      builder: (context, state) {
        if (state is! UnoFlipGameState) {
          return const Center(child: CircularProgressIndicator());
        }

        final gameState = state;

        return Scaffold(
          appBar: CustomAppBar(
            leftButtonText: S.of(context).back,
            onLeftButtonPressed: () => Navigator.pop(context),
            isRules: true,
            rightButtonText: S.of(context).rules,
            onRightButtonPressed: () =>
                Navigator.pushNamed(context, '/unoFlipRules'),
          ),
          body: SafeArea(
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
                            '${S.of(context).gameUpTo}${gameState.scoreLimit}',
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
                                  itemCount: gameState.players.length,
                                  pageSnapping: true,
                                  padEnds: true,
                                  onPageChanged: (index) {
                                    // Update local state
                                    _currentPageIndex = index;
                                    // Update state in BLoC
                                    bloc.add(ChangeCurrentPlayer(index));
                                  },
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            GeneralConst.paddingHorizontal / 2,
                                      ),
                                      child: PlayerCard(
                                        player: gameState.players[index],
                                      ),
                                    );
                                  },
                                ),

                                // animation for score
                                if (gameState.isScoreChanging)
                                  AnimatedBuilder(
                                    animation: _animation,
                                    builder: (context, child) {
                                      return Positioned(
                                        top: 60 - (_animation.value * 40),
                                        left: 0,
                                        right: 0,
                                        child: Opacity(
                                          opacity: 1.0 - _animation.value,
                                          child: Center(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 6,
                                              ),
                                              child: Text(
                                                gameState.lastScoreChange > 0
                                                    ? '+${gameState.lastScoreChange}'
                                                    : '${gameState.lastScoreChange}',
                                                style: theme.display2.copyWith(
                                                  color:
                                                      theme.secondaryTextColor,
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
                            children:
                                gameState.players.asMap().entries.map((entry) {
                              final index = entry.key;
                              final player = entry.value;
                              final firstLetter = player.name.characters.first;
                              return GestureDetector(
                                onTap: () {
                                  // Navigate to the needed page
                                  _pageController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: PlayerIndicator(
                                    letter: firstLetter,
                                    isActive:
                                        index == gameState.currentPlayerIndex,
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
                              buttonText: UnoLikeGameCardsText.one,
                              onPressed: () => _updateScore(1),
                            ),
                            KeyboardButton(
                              buttonText: UnoLikeGameCardsText.two,
                              onPressed: () => _updateScore(2),
                            ),
                            KeyboardButton(
                              buttonText: UnoLikeGameCardsText.three,
                              onPressed: () => _updateScore(3),
                            ),
                            KeyboardButton(
                              buttonText: UnoLikeGameCardsText.four,
                              onPressed: () => _updateScore(4),
                            ),
                          ],
                          [
                            KeyboardButton(
                              buttonText: UnoLikeGameCardsText.five,
                              onPressed: () => _updateScore(5),
                            ),
                            KeyboardButton(
                              buttonText: UnoLikeGameCardsText.six,
                              onPressed: () => _updateScore(6),
                            ),
                            KeyboardButton(
                              buttonText: UnoLikeGameCardsText.seven,
                              onPressed: () => _updateScore(7),
                            ),
                            KeyboardButton(
                              buttonText: UnoLikeGameCardsText.eight,
                              onPressed: () => _updateScore(8),
                            ),
                          ],
                          [
                            KeyboardButton(
                              buttonText: UnoLikeGameCardsText.nine,
                              onPressed: () => _updateScore(9),
                            ),
                            KeyboardButton(
                              buttonText: _isDarkSide
                                  ? UnoLikeGameCardsText.plusFive
                                  : UnoLikeGameCardsText.plusOne,
                              onPressed: () =>
                                  _updateScore(_isDarkSide ? 20 : 10),
                            ),
                            KeyboardButton(
                              buttonIcon: CustomIcons.reverse,
                              onPressed: () => _updateScore(20),
                            ),
                            _isDarkSide
                                ? KeyboardButton(
                                    buttonIcon: CustomIcons.skipEveryone,
                                    onPressed: () => _updateScore(30),
                                  )
                                : KeyboardButton(
                                    buttonIcon: CustomIcons.skip,
                                    onPressed: () => _updateScore(20),
                                  ),
                          ],
                          [
                            KeyboardButton(
                              buttonIcon: CustomIcons.flip,
                              onPressed: () => _updateScore(20),
                            ),
                            KeyboardButton(
                              buttonIcon: CustomIcons.wild,
                              onPressed: () => _updateScore(40),
                            ),
                            _isDarkSide
                                ? KeyboardButton(
                                    buttonIcon: CustomIcons.wildDrawColor,
                                    onPressed: () => _updateScore(60),
                                  )
                                : KeyboardButton(
                                    buttonIcon: CustomIcons.wildDrawTwoUnoflip,
                                    onPressed: () => _updateScore(50),
                                  ),
                            KeyboardButton(
                              flipText: true,
                              buttonText: S.of(context).flipnside,
                              onPressed:
                                  _toggleSide,
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
            dialogWidget: const InfoUnoFlipDialog(),
            isArrow: true,
            rightButtonText: S.of(context).finish,
            onLeftArrowTap: _undo,
            onRightArrowTap: _redo,
            onRightBtnTap: _showEndGameModalWithoutScoreLimit,
            isLeftArrowActive: bloc.canUndo(),
            isRightArrowActive: bloc.canRedo(),
          ),
        );
      },
    );
  }
}
