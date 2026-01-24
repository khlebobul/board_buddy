import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/features/games/common_counter/bloc/common_counter_bloc.dart';
import 'package:board_buddy/shared/widgets/ui/add_player_dialog.dart';
import 'package:board_buddy/shared/widgets/ui/animated_snackbar.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_static_icons/not_static_icons.dart';
import 'package:use_scramble/use_scramble.dart';

class CommonGameStartScreen extends StatelessWidget {
  const CommonGameStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CommonCounterBloc()..add(InitializeCommonCounterStartScreen()),
      child: const CommonGameStartScreenView(),
    );
  }
}

class CommonGameStartScreenView extends StatelessWidget {
  const CommonGameStartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommonCounterBloc, CommonCounterState>(
      listener: (context, state) {
        if (state is CommonCounterStartScreenState && state.hasSavedGame) {
          _showContinueGameDialog(context);
        }
      },
      builder: (context, state) {
        if (state is! CommonCounterStartScreenState) {
          return const Center(child: CircularProgressIndicator());
        }

        final counterState = state;
        final theme = UIThemes.of(context);

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: CustomAppBar(
              leftButtonText: S.of(context).back,
              onLeftButtonPressed: () => Navigator.pop(context),
              rightButtonText: S.of(context).common,
              onRightButtonPressed: () {},
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                        horizontal: GeneralConst.paddingHorizontal) +
                    const EdgeInsets.only(top: GeneralConst.paddingVertical),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // game mode
                      Text(
                        S.of(context).mode,
                        style: theme.display2
                            .copyWith(color: theme.secondaryTextColor),
                      ),
                      _buildModeOption(
                          context, S.of(context).singleplayer, counterState),
                      _buildModeOption(
                          context, S.of(context).multiplayer, counterState),
                      const SizedBox(height: 24),

                      // players list - only show in multiplayer mode
                      if (!counterState.isSinglePlayer) ...[
                        Text(
                          S.of(context).players,
                          style: theme.display2
                              .copyWith(color: theme.secondaryTextColor),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              counterState.players.asMap().entries.map((entry) {
                            int index = entry.key + 1;
                            Player player = entry.value;
                            String formattedIndex =
                                index.toString().padLeft(2, '0');
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '$formattedIndex - ${player.name}'
                                        .toLowerCase(),
                                    softWrap: true,
                                    style: theme.display2
                                        .copyWith(color: theme.textColor),
                                  ),
                                ),
                                XIcon(
                                  size: 20,
                                  color: theme.secondaryTextColor,
                                  strokeWidth: 1.5,
                                  onTap: () {
                                    context
                                        .read<CommonCounterBloc>()
                                        .add(RemovePlayer(entry.key));
                                  },
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 12),
                        if (counterState.players.length <
                            GameMaxPlayers.commonCounter)
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              final counterBloc =
                                  context.read<CommonCounterBloc>();
                              showDialog(
                                context: context,
                                builder: (dialogContext) => AddPlayerDialog(
                                  onPlayerAdded: (player) {
                                    counterBloc.add(AddPlayer(player));
                                  },
                                ),
                              );
                            },
                            child: TextScramble(
                                text: S.of(context).add,
                                builder: (context, scrambledText) => Text(
                                      scrambledText,
                                      style: theme.display2
                                          .copyWith(color: theme.redColor),
                                    )),
                          ),
                      ],

                      // bottom padding for keyboard
                      SizedBox(
                          height: MediaQuery.of(context).viewInsets.bottom > 0
                              ? 300
                              : 0),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomGameBar(
                rightButtonText: S.of(context).play,
                isRightBtnRed: true,
                onRightBtnTap: () {
                  if (!counterState.isSinglePlayer &&
                      counterState.players.length <
                          GameMinPlayers.commonCounter) {
                    AnimatedSnackBar.show(
                      context,
                      message:
                          '${S.of(context).theNumberOfPlayersShouldBe} ${GameMinPlayers.commonCounter}',
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      '/commonGame',
                      arguments: {
                        'players': counterState.isSinglePlayer
                            ? [Player(name: 'player', score: 0, id: 1)]
                            : counterState.players,
                        'isSinglePlayer': counterState.isSinglePlayer,
                      },
                    );
                  }
                }),
            resizeToAvoidBottomInset: true,
          ),
        );
      },
    );
  }

  void _showContinueGameDialog(BuildContext context) {
    final bloc = context.read<CommonCounterBloc>();

    ModalWindowWidget.showContinueGameDialog(
      context,
      onNewGame: () => bloc.deleteSavedGame(),
      onContinue: () {
        bloc.loadSavedGame();
        Navigator.pushNamed(context, '/commonGame');
      },
    );
  }

  Widget _buildModeOption(BuildContext context, String modeName,
      CommonCounterStartScreenState state) {
    final theme = UIThemes.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.read<CommonCounterBloc>().add(SelectGameMode(modeName));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: state.selectedMode == modeName
                ? theme.redColor
                : Colors.transparent,
            radius: 3,
          ),
          const SizedBox(width: 8),
          TextScramble(
              text: modeName,
              builder: (context, scrambledText) => Text(
                    scrambledText,
                    style: theme.display2,
                  )),
        ],
      ),
    );
  }
}
