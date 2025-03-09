import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/features/games/common_counter/widgets/game_end_common_counter_modal.dart';
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
class SetGame extends StatelessWidget {
  final List<Player> players;
  final bool isSinglePlayer;

  const SetGame({
    required this.players,
    required this.isSinglePlayer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetBloc()
        ..add(InitializeGameScreen(
          players: players,
          isSinglePlayer: isSinglePlayer,
        )),
      child: const SetGameView(),
    );
  }
}

class SetGameView extends StatelessWidget {
  const SetGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetBloc, SetState>(
      builder: (context, state) {
        if (state is! SetGameState) {
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
                Navigator.pushNamed(context, '/setRules'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                      horizontal: GeneralConst.paddingHorizontal) +
                  const EdgeInsets.only(top: GeneralConst.paddingVertical),
              child: Column(
                children: [
                  gameState.isSinglePlayer
                      ? const TimerWidget()
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
            rightButtonText: S.of(context).finish,
            onRightBtnTap: () {
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
        );
      },
    );
  }

  void _showGameEndModal(BuildContext context, SetGameState gameState) {
    GameEndCommonCounterModal.show(
      context,
      players: gameState.players,
      isSinglePlayer: gameState.isSinglePlayer,
      onContinue: () {
        Navigator.of(context).pop(); // Close the modal
      },
      onNewRound: () {
        Navigator.of(context).pop(); // Close the modal
        context.read<SetBloc>().add(ResetScores());
      },
      onNewGame: () {
        Navigator.of(context).pop(); // Close the modal
        Navigator.of(context).pop(); // Return to start screen
        Navigator.pushNamed(context, '/SetStartGame');
      },
      onReturnToMenu: () {
        Navigator.pushNamed(context, '/home');
      },
    );
  }
}
