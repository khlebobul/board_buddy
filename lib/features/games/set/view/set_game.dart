import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/common/utils/game_end_modal_helper.dart';
import 'package:board_buddy/features/games/set/bloc/set_bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/game_widgets/timer.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_score_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// set game screen
class SetGame extends StatefulWidget {
  final List<Player> players;
  final bool isSinglePlayer;

  const SetGame({
    this.players = const [],
    this.isSinglePlayer = false,
    super.key,
  });

  @override
  State<SetGame> createState() => _SetGameState();
}

class _SetGameState extends State<SetGame> with WidgetsBindingObserver {
  late SetBloc bloc;
  bool _isInitialized = false;
  final _timerKey = GlobalKey<TimerWidgetState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isInitialized) {
        bloc = context.read<SetBloc>();

        if (widget.players.isEmpty) {
          bloc.add(LoadSavedGame());
        } else {
          bloc.add(InitializeGameScreen(
            players: widget.players,
            isSinglePlayer: widget.isSinglePlayer,
          ));
        }

        _isInitialized = true;
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pauseTimer();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      _pauseTimer();
    }
  }

  void _pauseTimer() {
    final timerState = _timerKey.currentState;
    if (timerState != null) {
      final seconds = timerState.getSeconds();

      timerState.stopTimer();

      if (seconds > 0) {
        debugPrint('Pausing timer with value: $seconds seconds');
        if (mounted) {
          context.read<SetBloc>().add(SaveTimerValue(seconds));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlocBuilder<SetBloc, SetState>(
      builder: (context, state) {
        if (state is! SetGameState) {
          return Scaffold(
            backgroundColor: theme.bgColor,
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        final gameState = state;

        if (gameState.isSinglePlayer) {
          debugPrint(
              'Building SetGame with timerSeconds: ${gameState.timerSeconds}');
        }

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (gameState.isSinglePlayer) {
              _pauseTimer();
            }
          },
          child: Scaffold(
            appBar: CustomAppBar(
              leftButtonText: S.of(context).menu,
              onLeftButtonPressed: () {
                if (gameState.isSinglePlayer) {
                  _pauseTimer();
                }
                Navigator.pushNamed(context, '/home');
              },
              isRules: true,
              rightButtonText: S.of(context).rules,
              onRightButtonPressed: () {
                if (gameState.isSinglePlayer) {
                  _pauseTimer();
                }
                Navigator.pushNamed(context, '/setRules');
              },
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                        horizontal: GeneralConst.paddingHorizontal) +
                    const EdgeInsets.only(top: GeneralConst.paddingVertical),
                child: Column(
                  children: [
                    gameState.isSinglePlayer
                        ? TimerWidget(
                            key: _timerKey,
                            initialSeconds: gameState.timerSeconds,
                            onTimerChange: (seconds) {
                              debugPrint('Timer changed to $seconds seconds');
                              context.read<SetBloc>().add(UpdateTimer(seconds));
                            },
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: PlayersScoreWidget(
                            players: gameState.players,
                            onIncrease: (index) {
                              context.read<SetBloc>().add(IncreaseScore(index));
                            },
                            onDecrease: (index) {
                              context.read<SetBloc>().add(DecreaseScore(index));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomGameBar(
              isArrow: true,
              rightButtonText: S.of(context).options,
              onRightBtnTap: () {
                if (gameState.isSinglePlayer) {
                  _pauseTimer();
                }
                _showGameEndModal(context, gameState);
              },
              isLeftArrowActive: gameState.history.isNotEmpty,
              isRightArrowActive: gameState.redoHistory.isNotEmpty,
              onLeftArrowTap: gameState.history.isNotEmpty
                  ? () {
                      context.read<SetBloc>().add(UndoAction());
                    }
                  : null,
              onRightArrowTap: gameState.redoHistory.isNotEmpty
                  ? () {
                      context.read<SetBloc>().add(RedoAction());
                    }
                  : null,
            ),
          ),
        );
      },
    );
  }

  void _showGameEndModal(BuildContext context, SetGameState gameState) {
    // Save the game when opening options modal (in case user exits to menu)
    context.read<SetBloc>().add(SaveGameSession());

    GameEndModalHelper.showCommonCounterStyleModal(
      context: context,
      players: gameState.players,
      isSinglePlayer: gameState.isSinglePlayer,
      maxPlayers: GameMaxPlayers.set,
      onContinue: () {},
      onNewRound: () {
        context.read<SetBloc>().add(ResetScores());
      },
      onNewGame: () {
        // Delete the saved game before starting a new one
        context.read<SetBloc>().add(DeleteSavedGame());
        // Helper already closed the modal, just navigate
        Navigator.pushNamed(context, '/setStartGame');
      },
      onReturnToMenu: () {
        Navigator.pushNamed(context, '/home');
      },
      onAddPlayerToBloc: (newPlayer) {
        context.read<SetBloc>().add(AddPlayer(newPlayer));
      },
      onReopenModal: (ctx, updatedPlayers) {
        _showGameEndModal(
          ctx,
          gameState.copyWith(players: updatedPlayers),
        );
      },
    );
  }
}
