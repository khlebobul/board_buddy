import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/common/utils/game_end_modal_helper.dart';
import 'package:board_buddy/features/games/catan/bloc/catan_bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/game_widgets/player_card.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_indicator.dart';
import 'package:board_buddy/shared/widgets/game_widgets/points_keyboard.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatanGame extends StatefulWidget {
  final List<Player> players;
  final int scoreLimit;
  final String gameMode;

  const CatanGame({
    super.key,
    required this.players,
    required this.scoreLimit,
    required this.gameMode,
  });

  @override
  State<CatanGame> createState() => _CatanGameState();
}

class _CatanGameState extends State<CatanGame> with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  late Animation<double> _animation;

  int _currentPageIndex = 0;
  bool _isInitialized = false;
  bool _isGameEndModalShown = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutQuad,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isInitialized) {
        final bloc = context.read<CatanBloc>();
        if (widget.players.isEmpty) {
          bloc.add(LoadSavedGame());
        } else {
          bloc.add(InitializeCatanGame(
            players: widget.players,
            scoreLimit: widget.scoreLimit,
            gameMode: widget.gameMode,
          ));
        }
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

  void _updateScore(int score) {
    final bloc = context.read<CatanBloc>();
    bloc.add(UpdatePlayerScore(score));
    _animationController.reset();
    _animationController.forward().then((_) {
      bloc.add(ResetScoreAnimation());
    });
  }

  void _undo() {
    final bloc = context.read<CatanBloc>();
    if (bloc.canUndo()) {
      bloc.add(UndoScoreChange());
      _animationController.reset();
      _animationController.forward().then((_) {
        bloc.add(ResetScoreAnimation());
      });
    }
  }

  void _redo() {
    final bloc = context.read<CatanBloc>();
    if (bloc.canRedo()) {
      bloc.add(RedoScoreChange());
      _animationController.reset();
      _animationController.forward().then((_) {
        bloc.add(ResetScoreAnimation());
      });
    }
  }

  void _showGameEndModal(
      List<Player> players, String gameMode, int scoreLimit) {
    if (_isGameEndModalShown) return;
    _isGameEndModalShown = true;

    final bloc = context.read<CatanBloc>();
    bloc.add(MarkGameEndModalShown());
    bloc.add(SaveGameSession());

    GameEndModalHelper.showUnoStyleModal(
      context: context,
      players: players,
      gameMode: gameMode,
      scoreLimit: scoreLimit,
      maxPlayers: 6,
      onContinueGame: () {
        bloc.add(ContinueGame());
        _isGameEndModalShown = false;
      },
      onNewGameWithSamePlayers: () {
        bloc.add(StartNewGameWithSamePlayers());
        _isGameEndModalShown = false;
      },
      onNewGame: () {
        bloc.add(DeleteSavedGame());
        bloc.add(StartNewGame());
        _isGameEndModalShown = false;
      },
      onReturnToMenu: () {
        _isGameEndModalShown = false;
      },
      onAddPlayerToBloc: (player) {
        bloc.add(AddPlayer(player));
      },
      onReopenModal: (updatedPlayers, updatedGameMode, updatedScoreLimit) {
        final current = bloc.state;
        if (current is CatanGameState) {
          _isGameEndModalShown = false;
          _showGameEndModal(
              current.players, current.gameMode, current.scoreLimit);
        }
      },
    );
  }

  void _showEndGameModalWithoutScoreLimit() {
    final bloc = context.read<CatanBloc>();
    final currentState = bloc.state;
    if (currentState is CatanGameState) {
      _showGameEndModal(
          currentState.players, currentState.gameMode, currentState.scoreLimit);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final bloc = context.read<CatanBloc>();

    return BlocConsumer<CatanBloc, CatanState>(
      listenWhen: (previous, current) {
        if (current is CatanGameState && previous is CatanGameState) {
          if (previous.gameEnded && current.gameEnded) {
            return false;
          }
        }
        return current is CatanGameState;
      },
      listener: (context, state) {
        if (state is CatanGameState) {
          if (state.currentPlayerIndex != _currentPageIndex) {
            _pageController.animateToPage(
              state.currentPlayerIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }

          if (state.gameEnded &&
              !state.hasShownGameEndModal &&
              !_isGameEndModalShown) {
            _showGameEndModal(state.players, state.gameMode, state.scoreLimit);
          }
        }
      },
      builder: (context, state) {
        if (state is! CatanGameState) {
          return const Center(child: CircularProgressIndicator());
        }

        final gameState = state;

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: CustomAppBar(
              leftButtonText: S.of(context).menu,
              onLeftButtonPressed: () => Navigator.pushNamed(context, '/home'),
              isRules: true,
              rightButtonText: S.of(context).rules,
              onRightButtonPressed: () =>
                  Navigator.pushNamed(context, '/catanRules'),
            ),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
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
                                      _currentPageIndex = index;
                                      bloc.add(ChangeCurrentPlayer(index));
                                    },
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              GeneralConst.paddingHorizontal /
                                                  2,
                                        ),
                                        child: PlayerCard(
                                          player: gameState.players[index],
                                        ),
                                      );
                                    },
                                  ),
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
                                                  style:
                                                      theme.display2.copyWith(
                                                    color: theme
                                                        .secondaryTextColor,
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
                              children: gameState.players
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                final index = entry.key;
                                final player = entry.value;
                                final firstLetter =
                                    player.name.characters.first;
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    _pageController.animateToPage(
                                      index,
                                      duration:
                                          const Duration(milliseconds: 300),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: GeneralConst.paddingHorizontal),
                        child: CustomKeyboard(
                          buttons: [
                            [
                              KeyboardButton(
                                buttonText: '+1',
                                onPressed: () => _updateScore(1),
                              ),
                              KeyboardButton(
                                buttonText: '+2',
                                onPressed: () => _updateScore(2),
                              ),
                              KeyboardButton(
                                buttonText: '-1',
                                onPressed: () => _updateScore(-1),
                              ),
                              KeyboardButton(
                                buttonText: '-2',
                                onPressed: () => _updateScore(-2),
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
              isArrow: true,
              rightButtonText: S.of(context).options,
              onLeftArrowTap: _undo,
              onRightArrowTap: _redo,
              onRightBtnTap: _showEndGameModalWithoutScoreLimit,
              isLeftArrowActive: bloc.canUndo(),
              isRightArrowActive: bloc.canRedo(),
            ),
          ),
        );
      },
    );
  }
}
