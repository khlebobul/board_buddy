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

class _CatanGameState extends State<CatanGame> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    final bloc = context.read<CatanBloc>();
    if (widget.players.isNotEmpty) {
      bloc.add(InitializeCatanGame(
        players: widget.players,
        scoreLimit: widget.scoreLimit,
        gameMode: widget.gameMode,
      ));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _updateScore(int score) {
    final bloc = context.read<CatanBloc>();
    bloc.add(UpdatePlayerScore(score));
  }

  void _undo() {
    final bloc = context.read<CatanBloc>();
    if (bloc.canUndo()) {
      bloc.add(UndoScoreChange());
    }
  }

  void _redo() {
    final bloc = context.read<CatanBloc>();
    if (bloc.canRedo()) {
      bloc.add(RedoScoreChange());
    }
  }

  void _showEndGameModalWithoutScoreLimit() {
    final bloc = context.read<CatanBloc>();
    final state = bloc.state;
    if (state is CatanGameState) {
      GameEndModalHelper.showUnoStyleModal(
        context: context,
        players: state.players,
        gameMode: state.gameMode,
        scoreLimit: state.scoreLimit,
        maxPlayers: 6,
        onContinueGame: () {
          bloc.add(ContinueGame());
        },
        onNewGameWithSamePlayers: () {
          bloc.add(StartNewGameWithSamePlayers());
        },
        onNewGame: () {
          bloc.add(StartNewGame());
          Navigator.of(context).pop();
        },
        onReturnToMenu: () {
          bloc.add(ReturnToMenu());
        },
        onAddPlayerToBloc: (player) {
          bloc.add(AddPlayer(player));
        },
        onReopenModal: (players, gameMode, scoreLimit) {
          _showEndGameModalWithoutScoreLimit();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CatanBloc, CatanState>(
      listener: (context, state) {
        if (state is CatanGameState && state.gameEnded) {
          if (!state.hasShownGameEndModal) {
            context.read<CatanBloc>().add(MarkGameEndModalShown());
            final bloc = context.read<CatanBloc>();
            GameEndModalHelper.showUnoStyleModal(
              context: context,
              players: state.players,
              gameMode: state.gameMode,
              scoreLimit: state.scoreLimit,
              maxPlayers: 6,
              onContinueGame: () {
                bloc.add(ContinueGame());
              },
              onNewGameWithSamePlayers: () {
                bloc.add(StartNewGameWithSamePlayers());
              },
              onNewGame: () {
                bloc.add(StartNewGame());
                Navigator.of(context).pop();
              },
              onReturnToMenu: () {
                bloc.add(ReturnToMenu());
              },
              onAddPlayerToBloc: (player) {
                bloc.add(AddPlayer(player));
              },
              onReopenModal: (players, gameMode, scoreLimit) {
                _showEndGameModalWithoutScoreLimit();
              },
            );
          }
        }
      },
      builder: (context, state) {
        if (state is! CatanGameState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final gameState = state;
        final theme = UIThemes.of(context);
        final bloc = context.read<CatanBloc>();

        return Scaffold(
          backgroundColor: theme.bgColor,
          appBar: CustomAppBar(
            leftButtonText: S.of(context).back,
            onLeftButtonPressed: () => Navigator.pop(context),
            rightButtonText: 'catan',
            onRightButtonPressed: () {},
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 400,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            bloc.add(ChangeCurrentPlayer(index));
                          },
                          itemCount: gameState.players.length,
                          itemBuilder: (context, index) {
                            final player = gameState.players[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: GeneralConst.paddingHorizontal),
                              child: PlayerCard(
                                player: player,
                              ),
                            );
                          },
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
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
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
                          buttonText: '1',
                          onPressed: () => _updateScore(1),
                        ),
                        KeyboardButton(
                          buttonText: '2',
                          onPressed: () => _updateScore(2),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          bottomNavigationBar: BottomGameBar(
            dialogWidget: Container(),
            isArrow: true,
            rightButtonText: S.of(context).options,
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
