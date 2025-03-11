import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:board_buddy/shared/widgets/bottom_sheets/munchkin_modifiers_bs.dart';
import 'package:board_buddy/features/games/muncknin/widgets/munchkin_score_widget.dart';
import 'package:board_buddy/features/games/muncknin/widgets/info_munchkin_dialog_widget.dart';
import 'package:board_buddy/features/games/muncknin/bloc/munchkin_bloc.dart';
import 'package:board_buddy/shared/widgets/game_widgets/dice_modal.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:use_scramble/use_scramble.dart';

/// munchkin game screen
class MunchkinGame extends StatelessWidget {
  final List<Player> players;
  final bool isSinglePlayer;

  const MunchkinGame({
    super.key,
    required this.players,
    required this.isSinglePlayer,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlocProvider(
      create: (context) => MunchkinBloc()
        ..add(InitializeGameScreen(
          players: players,
          isSinglePlayer: isSinglePlayer,
        )),
      child: BlocBuilder<MunchkinBloc, MunchkinState>(
        builder: (context, state) {
          if (state is MunchkinGameState) {
            return Scaffold(
              appBar: CustomAppBar(
                leftButtonText: S.of(context).back,
                onLeftButtonPressed: () => Navigator.pop(context),
                isRules: true,
                rightButtonText: S.of(context).rules,
                onRightButtonPressed: () =>
                    Navigator.pushNamed(context, '/munchkinRules'),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: GeneralConst.paddingHorizontal),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () => DiceModal.show(context),
                          child: SvgPicture.asset(
                            CustomIcons.dice,
                            width: 27,
                            height: 27,
                            // ignore: deprecated_member_use
                            color: theme.textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    if (state.players.length > 1)
                      _buildMultiPlayerView(context, state)
                    else
                      _buildSinglePlayerView(context, state),
                    const SizedBox(height: 50),
                    state.players.length > 1
                        ? GestureDetector(
                            onTap: () => showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) =>
                                  const MunchkinModifiersBottomSheet(),
                            ),
                            child: TextScramble(
                              text: S.of(context).modifiers,
                              style: theme.display2
                                  .copyWith(color: theme.redColor),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              bottomNavigationBar: BottomGameBar(
                dialogWidget: state.players.length > 1
                    ? const InfoMunchkinDialogWidget()
                    : null,
                isArrow: true,
                rightButtonText: S.of(context).finish,
                onRightBtnTap: () => _showEndGameModal(context, state),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _showEndGameModal(BuildContext context, MunchkinGameState state) {
    // Create a formatted string with player stats
    String playerStats = '';
    if (state.isSinglePlayer) {
      // In single player mode, don't show player name
      final player = state.players.first;
      playerStats +=
          '${S.of(context).level} ${player.level}, ${S.of(context).gear} ${player.gear}';
    } else {
      // In multiplayer mode, show player names
      for (int i = 0; i < state.players.length; i++) {
        final player = state.players[i];
        playerStats +=
            '${player.name}: ${S.of(context).level} ${player.level}, ${S.of(context).gear} ${player.gear}\n';
      }
    }

    ModalWindowWidget.show(
      context,
      mainText: playerStats,
      button1Text: S.of(context).doReturn,
      button2Text: S.of(context).finish,
      button1Action: () => Navigator.pop(context),
      button2Action: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
      },
    );
  }

  Widget _buildMultiPlayerView(BuildContext context, MunchkinGameState state) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          state.players.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: MunchkinScoreWidget(
              playerName: state.players[index].name,
              totalScore: state.players[index].score,
              gearScore: state.players[index].gear,
              level: state.players[index].level,
              onIncrease: (scoreType) {
                if (scoreType == 0) {
                  context.read<MunchkinBloc>().add(IncreaseGear(index));
                } else {
                  context.read<MunchkinBloc>().add(IncreaseLevel(index));
                }
              },
              onDecrease: (scoreType) {
                if (scoreType == 0) {
                  context.read<MunchkinBloc>().add(DecreaseGear(index));
                } else {
                  context.read<MunchkinBloc>().add(DecreaseLevel(index));
                }
              },
              isSinglePlayer: false,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSinglePlayerView(BuildContext context, MunchkinGameState state) {
    return Expanded(
      child: Center(
        child: MunchkinScoreWidget(
          playerName: state.players.first.name,
          totalScore: state.players.first.score,
          gearScore: state.players.first.gear,
          level: state.players.first.level,
          onIncrease: (scoreType) {
            if (scoreType == 0) {
              context.read<MunchkinBloc>().add(IncreaseGear(0));
            } else {
              context.read<MunchkinBloc>().add(IncreaseLevel(0));
            }
          },
          onDecrease: (scoreType) {
            if (scoreType == 0) {
              context.read<MunchkinBloc>().add(DecreaseGear(0));
            } else {
              context.read<MunchkinBloc>().add(DecreaseLevel(0));
            }
          },
          isSinglePlayer: true,
        ),
      ),
    );
  }
}

/// Wrapper for the MunchkinGame that extracts arguments from the route
class MunchkinGameWrapper extends StatelessWidget {
  final List<Player>? players;
  final bool? isSinglePlayer;

  const MunchkinGameWrapper({
    super.key,
    this.players,
    this.isSinglePlayer,
  });

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final List<Player> finalPlayers = players ??
        args?['players'] ??
        [Player(name: 'Player', score: 0, id: 1)];
    final bool finalIsSinglePlayer =
        isSinglePlayer ?? args?['isSinglePlayer'] ?? true;

    return MunchkinGame(
      players: finalPlayers,
      isSinglePlayer: finalIsSinglePlayer,
    );
  }
}
