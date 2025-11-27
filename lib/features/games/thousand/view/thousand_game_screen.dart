import 'package:board_buddy/config/routes/routes.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/common/utils/game_end_modal_helper.dart';
import 'package:board_buddy/features/games/thousand/bloc/thousand_bloc.dart';
import 'package:board_buddy/features/games/thousand/models/thousand_models.dart';
import 'package:board_buddy/features/games/thousand/widgets/barrel_warning_widget.dart';
import 'package:board_buddy/features/games/thousand/widgets/bidding_phase_widget.dart';
import 'package:board_buddy/features/games/thousand/widgets/info_thousand_dialog_widget.dart';
import 'package:board_buddy/features/games/thousand/widgets/scoring_phase_widget.dart';
import 'package:board_buddy/features/games/thousand/widgets/select_dealer_widget.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThousandGameScreen extends StatelessWidget {
  const ThousandGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return PopScope(
      canPop: false,
      child: BlocListener<ThousandBloc, ThousandState>(
        listener: (context, state) {
          if (state is GameEndedState) {
            _showGameEndModal(context, state);
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(
            leftButtonText: S.of(context).menu,
            onLeftButtonPressed: () => Navigator.pushNamed(context, '/home'),
            isRules: true,
            rightButtonText: S.of(context).rules,
            onRightButtonPressed: () =>
                Navigator.pushNamed(context, AppRoutes.thousandRules),
          ),
          body: SafeArea(
            child: BlocBuilder<ThousandBloc, ThousandState>(
              builder: (context, state) {
                if (state is SelectingFirstDealerState) {
                  return SelectDealerWidget(state: state);
                } else if (state is BiddingPhaseState) {
                  return BiddingPhaseWidget(state: state);
                } else if (state is ScoringPhaseState) {
                  return ScoringPhaseWidget(state: state);
                } else if (state is BarrelWarningState) {
                  return BarrelWarningWidget(state: state);
                } else if (state is GameEndedState) {
                  return const SizedBox.shrink();
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.redColor,
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: BlocBuilder<ThousandBloc, ThousandState>(
            builder: (context, state) {
              final bloc = context.read<ThousandBloc>();

              if (state is SelectingFirstDealerState) {
                return BottomGameBar(
                  isArrow: false,
                  rightButtonText: S.of(context).options,
                  onRightBtnTap: () => _showOptionsModal(context),
                );
              } else if (state is BiddingPhaseState ||
                  state is ScoringPhaseState) {
                return BottomGameBar(
                  isArrow: true,
                  dialogWidget: const InfoThousandDialog(),
                  rightButtonText: S.of(context).options,
                  onRightBtnTap: () => _showOptionsModal(context),
                  onLeftArrowTap: bloc.undo,
                  onRightArrowTap: bloc.redo,
                  isLeftArrowActive: bloc.canUndo(),
                  isRightArrowActive: bloc.canRedo(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  void _showGameEndModal(BuildContext context, GameEndedState state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      GameEndModalHelper.showThousandStyleModal(
        context: context,
        players: state.players,
        playerData: state.playerData,
        winnerIndex: state.winnerIndex,
        onNewGameWithSamePlayers: () {
          context.read<ThousandBloc>().add(StartNewGameWithSamePlayers());
        },
        onNewGame: () {
          Navigator.of(context).pop();
          Navigator.pushNamed(context, '/thousandStartGame');
        },
        onReturnToMenu: () {
          Navigator.of(context).pop();
        },
      );
    });
  }

  void _showOptionsModal(BuildContext context) {
    final bloc = context.read<ThousandBloc>();
    final currentState = bloc.state;

    List<Player> players = [];
    Map<int, ThousandPlayerData> playerData = {};

    if (currentState is SelectingFirstDealerState) {
      players = currentState.players;
      playerData = currentState.playerData;
    } else if (currentState is BiddingPhaseState) {
      players = currentState.players;
      playerData = currentState.playerData;
    } else if (currentState is ScoringPhaseState) {
      players = currentState.players;
      playerData = currentState.playerData;
    } else if (currentState is BarrelWarningState) {
      players = currentState.players;
      playerData = currentState.playerData;
    }

    if (players.isNotEmpty) {
      GameEndModalHelper.showThousandStyleModal(
        context: context,
        players: players,
        playerData: playerData,
        winnerIndex: null,
        onContinueGame: () {},
        onNewGameWithSamePlayers: () {
          bloc.add(StartNewGameWithSamePlayers());
        },
        onNewGame: () {
          Navigator.of(context).pop();
          Navigator.pushNamed(context, '/thousandStartGame');
        },
        onReturnToMenu: () {
          Navigator.of(context).pop();
        },
      );
    }
  }
}
