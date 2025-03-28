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

class _SetGameState extends State<SetGame> {
  late SetBloc bloc;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

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
  Widget build(BuildContext context) {
    return BlocBuilder<SetBloc, SetState>(
      builder: (context, state) {
        if (state is! SetGameState) {
          return const Center(child: CircularProgressIndicator());
        }

        final gameState = state;

        return Scaffold(
          appBar: CustomAppBar(
            leftButtonText: S.of(context).menu,
            onLeftButtonPressed: () => Navigator.pushNamed(context, '/home'),
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
    context.read<SetBloc>().add(DeleteSavedGame());

    GameEndCommonCounterModal.show(
      context,
      players: gameState.players,
      isSinglePlayer: gameState.isSinglePlayer,
      onContinue: () {
        Navigator.of(context).pop();
      },
      onNewRound: () {
        Navigator.of(context).pop();
        context.read<SetBloc>().add(ResetScores());
      },
      onNewGame: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/setStartGame');
      },
      onReturnToMenu: () {
        Navigator.pushNamed(context, '/home');
      },
    );
  }
}
