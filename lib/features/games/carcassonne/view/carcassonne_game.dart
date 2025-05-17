import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/features/games/carcassonne/bloc/carcassonne_bloc.dart';
import 'package:board_buddy/features/games/common_counter/widgets/game_end_common_counter_modal.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_score_widget.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarcassonneGame extends StatelessWidget {
  final List<Player> players;
  final bool isAutomatic;

  const CarcassonneGame({
    this.players = const [],
    this.isAutomatic = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarcassonneBloc()
        ..add(
          InitializeGameScreen(
            players: players,
            isAutomatic: isAutomatic,
          ),
        ),
      child: const CarcassonneGameView(),
    );
  }
}

class CarcassonneGameView extends StatelessWidget {
  const CarcassonneGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarcassonneBloc, CarcassonneState>(
      builder: (context, state) {
        if (state is! CarcassonneGameState) {
          return const Center(child: CircularProgressIndicator());
        }

        final gameState = state;

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: CustomAppBar(
              leftButtonText: S.of(context).menu,
              onLeftButtonPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              isRules: true,
              rightButtonText: S.of(context).rules,
              onRightButtonPressed: () {
                Navigator.pushNamed(context, '/carcassonneRules');
              },
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                        horizontal: GeneralConst.paddingHorizontal) +
                    const EdgeInsets.only(top: GeneralConst.paddingVertical),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: PlayersScoreWidget(
                            players: gameState.players,
                            onIncrease: (index) {
                              context
                                  .read<CarcassonneBloc>()
                                  .add(IncreaseScore(index));
                            },
                            onDecrease: (index) {
                              context
                                  .read<CarcassonneBloc>()
                                  .add(DecreaseScore(index));
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
              rightButtonText: S.of(context).finish,
              onRightBtnTap: () {
                _showGameEndModal(context, gameState);
              },
              isLeftArrowActive: gameState.history.isNotEmpty,
              isRightArrowActive: gameState.redoHistory.isNotEmpty,
              onLeftArrowTap: gameState.history.isNotEmpty
                  ? () {
                      context.read<CarcassonneBloc>().add(UndoAction());
                    }
                  : null,
              onRightArrowTap: gameState.redoHistory.isNotEmpty
                  ? () {
                      context.read<CarcassonneBloc>().add(RedoAction());
                    }
                  : null,
            ),
          ),
        );
      },
    );
  }

  void _showGameEndModal(BuildContext context, CarcassonneGameState gameState) {
    context.read<CarcassonneBloc>().add(DeleteSavedGame());

    GameEndCommonCounterModal.show(
      context,
      players: gameState.players,
      isSinglePlayer: false,
      onContinue: () {
        Navigator.of(context).pop();
      },
      onNewRound: () {
        Navigator.of(context).pop();
        context.read<CarcassonneBloc>().add(ResetScores());
      },
      onNewGame: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/carcassonneStartGame');
      },
      onReturnToMenu: () {
        Navigator.pushNamed(context, '/home');
      },
    );
  }
}
