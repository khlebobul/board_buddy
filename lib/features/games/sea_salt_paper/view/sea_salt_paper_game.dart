import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/common/utils/game_end_modal_helper.dart';
import 'package:board_buddy/features/games/sea_salt_paper/bloc/sea_salt_paper_bloc.dart';
import 'package:board_buddy/features/games/sea_salt_paper/widgets/info_sea_salt_paper_dialog.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/game_widgets/player_card.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_indicator.dart';
import 'package:board_buddy/shared/widgets/game_widgets/points_keyboard.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_static_icons/not_static_icons.dart';

class SeaSaltPaperGame extends StatefulWidget {
  final List<Player> players;
  final int scoreLimit;

  const SeaSaltPaperGame({
    super.key,
    required this.players,
    required this.scoreLimit,
  });

  @override
  State<SeaSaltPaperGame> createState() => _SeaSaltPaperGameState();
}

class _SeaSaltPaperGameState extends State<SeaSaltPaperGame>
    with TickerProviderStateMixin {
  late final PageController _pageController;
  late final AnimationController _animationController;
  late final Animation<double> _animation;

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
        final bloc = context.read<SeaSaltPaperBloc>();

        if (widget.players.isEmpty) {
          bloc.add(LoadSavedSeaSaltPaperGame());
        } else {
          bloc.add(InitializeSeaSaltPaperGame(
            players: widget.players,
            scoreLimit: widget.scoreLimit,
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

  void _updateScore(int scoreChange) {
    final bloc = context.read<SeaSaltPaperBloc>();
    bloc.updateScore(scoreChange);
    _animationController.reset();
    _animationController.forward().then((_) {
      bloc.resetScoreAnimation();
    });
  }

  void _showCollectionDialog() {
    final theme = UIThemes.of(context);
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: theme.fgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: theme.borderColor),
        ),
        title: Text(
          S.of(context).collection,
          style: theme.display2.copyWith(color: theme.textColor),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children:
              SeaSaltPaperCollectionPoints.points.asMap().entries.map((entry) {
            final count = entry.key + 1;
            final points = entry.value;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.pop(dialogContext);
                _updateScore(points);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$count ${count == 1 ? S.of(context).card : S.of(context).cards}',
                      style: theme.display3.copyWith(color: theme.textColor),
                    ),
                    Text(
                      '+$points',
                      style: theme.display3.copyWith(color: theme.redColor),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showColorMajorityDialog() {
    final theme = UIThemes.of(context);
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: theme.fgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: theme.borderColor),
        ),
        title: Text(
          S.of(context).colorMajority,
          style: theme.display2.copyWith(color: theme.textColor),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).enterNumberOfCards,
              style: theme.display3.copyWith(color: theme.secondaryTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: theme.display3.copyWith(color: theme.textColor),
              decoration: InputDecoration(
                hintText: '0',
                hintStyle:
                    theme.display3.copyWith(color: theme.secondaryTextColor),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.borderColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.textColor),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              S.of(context).cancel,
              style: theme.display3.copyWith(color: theme.secondaryTextColor),
            ),
          ),
          TextButton(
            onPressed: () {
              final value = int.tryParse(controller.text) ?? 0;
              Navigator.pop(dialogContext);
              if (value > 0) {
                _updateScore(value);
              }
            },
            child: Text(
              S.of(context).add,
              style: theme.display3.copyWith(color: theme.redColor),
            ),
          ),
        ],
      ),
    );
  }

  void _showMermaidVictoryDialog() {
    UIThemes.of(context);
    final bloc = context.read<SeaSaltPaperBloc>();
    final currentState = bloc.state;

    if (currentState is! SeaSaltPaperGameState) return;

    final currentPlayer = currentState.players[currentState.currentPlayerIndex];

    ModalWindowWidget.show(
      context,
      mainText: '${currentPlayer.name} ${S.of(context).collectsFourMermaids}',
      button1Text: S.of(context).cancel,
      button2Text: S.of(context).declareVictory,
      button1Action: () => Navigator.pop(context),
      button2Action: () {
        Navigator.pop(context);
        bloc.add(DeclareMermaidVictory());
      },
    );
  }

  void _showGameEndModal(List<Player> players, int scoreLimit) {
    if (_isGameEndModalShown) return;

    _isGameEndModalShown = true;

    final bloc = context.read<SeaSaltPaperBloc>();
    bloc.markGameEndModalShown();
    bloc.add(SaveSeaSaltPaperGameSession());

    GameEndModalHelper.showUnoStyleModal(
      context: context,
      players: players,
      gameMode: S.of(context).highestScoreWins,
      scoreLimit: scoreLimit,
      maxPlayers: GameMaxPlayers.seaSaltPaper,
      onContinueGame: () {
        bloc.continueGame();
        _isGameEndModalShown = false;
      },
      onNewGameWithSamePlayers: () {
        bloc.startNewGameWithSamePlayers();
        _isGameEndModalShown = false;
      },
      onNewGame: () {
        bloc.add(DeleteSavedSeaSaltPaperGame());
        bloc.startNewGame();
        _isGameEndModalShown = false;
      },
      onReturnToMenu: () {
        _isGameEndModalShown = false;
      },
      onAddPlayerToBloc: (newPlayer) {
        bloc.add(AddSeaSaltPaperPlayer(newPlayer));
      },
      onReopenModal: (updatedPlayers, _, updatedScoreLimit) {
        final current = bloc.state;
        if (current is SeaSaltPaperGameState) {
          _isGameEndModalShown = false;
          _showGameEndModal(current.players, current.scoreLimit);
        }
      },
    );
  }

  void _showEndGameModalWithoutScoreLimit() {
    final bloc = context.read<SeaSaltPaperBloc>();
    final currentState = bloc.state;

    if (currentState is SeaSaltPaperGameState) {
      _showGameEndModal(currentState.players, currentState.scoreLimit);
    } else {
      ModalWindowWidget.show(
        context,
        mainText: S.of(context).youHaveAnUnfinishedGame,
        button1Text: S.of(context).doReturn,
        button2Text: S.of(context).options,
        button1Action: () => Navigator.pop(context),
        button2Action: () {
          bloc.returnToMenu();
          Navigator.pushNamed(context, '/home');
        },
      );
    }
  }

  void _undo() {
    final bloc = context.read<SeaSaltPaperBloc>();
    bloc.undo();
    _animationController.reset();
    _animationController.forward().then((_) {
      bloc.resetScoreAnimation();
    });
  }

  void _redo() {
    final bloc = context.read<SeaSaltPaperBloc>();
    bloc.redo();
    _animationController.reset();
    _animationController.forward().then((_) {
      bloc.resetScoreAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final bloc = context.read<SeaSaltPaperBloc>();

    return BlocConsumer<SeaSaltPaperBloc, SeaSaltPaperState>(
      listenWhen: (previous, current) {
        if (current is SeaSaltPaperGameState &&
            previous is SeaSaltPaperGameState) {
          if (previous.gameEnded && current.gameEnded) {
            return false;
          }
        }
        return current is SeaSaltPaperGameState;
      },
      listener: (context, state) {
        if (state is SeaSaltPaperGameState) {
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
            _showGameEndModal(state.players, state.scoreLimit);
          }
        }
      },
      builder: (context, state) {
        if (state is! SeaSaltPaperGameState) {
          return Scaffold(
            backgroundColor: theme.bgColor,
            body: const Center(child: CircularProgressIndicator()),
          );
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
                  Navigator.pushNamed(context, '/seaSaltPaperRules'),
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
                        height: constraints.maxHeight * 0.35,
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
                                      bloc.add(ChangeSeaSaltPaperCurrentPlayer(
                                          index));
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
                                buttonText: GameConst.plusOne,
                                onPressed: () => _updateScore(1),
                              ),
                              KeyboardButton(
                                buttonText: GameConst.plusTwo,
                                onPressed: () => _updateScore(2),
                              ),
                              KeyboardButton(
                                buttonText: GameConst.plusThree,
                                onPressed: () => _updateScore(3),
                              ),
                              KeyboardButton(
                                buttonText: GameConst.plusFive,
                                onPressed: () => _updateScore(5),
                              ),
                            ],
                            [
                              KeyboardButton(
                                buttonText: GameConst.plusSeven,
                                onPressed: () => _updateScore(7),
                              ),
                              KeyboardButton(
                                icon: ShellIcon(),
                                onPressed: _showCollectionDialog,
                              ),
                              KeyboardButton(
                                icon: PaletteIcon(),
                                onPressed: _showColorMajorityDialog,
                              ),
                              KeyboardButton(
                                icon: CrownIcon(),
                                onPressed: _showMermaidVictoryDialog,
                                textColor: theme.redColor,
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
              dialogWidget: const InfoSeaSaltPaperDialog(),
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
