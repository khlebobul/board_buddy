import 'package:board_buddy/features/games/set/bloc/set_bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/add_player_dialog.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_scramble/use_scramble.dart';

class SetGameStartScreen extends StatelessWidget {
  const SetGameStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetBloc()..add(InitializeSetStartScreen()),
      child: const SetGameStartScreenView(),
    );
  }
}

class SetGameStartScreenView extends StatelessWidget {
  const SetGameStartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetBloc, SetState>(
      listener: (context, state) {
        if (state is SetStartScreenState && state.hasSavedGame) {
          _showContinueGameDialog(context);
        }
      },
      builder: (context, state) {
        if (state is! SetStartScreenState) {
          return const Center(child: CircularProgressIndicator());
        }

        final setState = state;
        final theme = UIThemes.of(context);

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: CustomAppBar(
              leftButtonText: S.of(context).back,
              onLeftButtonPressed: () => Navigator.pop(context),
              rightButtonText: S.of(context).set,
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
                          context, S.of(context).singleplayer, setState),
                      _buildModeOption(
                          context, S.of(context).multiplayer, setState),
                      const SizedBox(height: 24),

                      // players list - only show in multiplayer mode
                      if (!setState.isSinglePlayer) ...[
                        Text(
                          S.of(context).players,
                          style: theme.display2
                              .copyWith(color: theme.secondaryTextColor),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              setState.players.asMap().entries.map((entry) {
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
                                IconButton(
                                  icon: Icon(Icons.close,
                                      color: theme.secondaryTextColor),
                                  onPressed: () {
                                    context
                                        .read<SetBloc>()
                                        .add(RemovePlayer(entry.key));
                                  },
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 12),
                        if (setState.players.length < GameMaxPlayers.set)
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              final setBloc = context.read<SetBloc>();
                              showDialog(
                                context: context,
                                builder: (dialogContext) => AddPlayerDialog(
                                  onPlayerAdded: (player) {
                                    setBloc.add(AddPlayer(player));
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
                leftButtonText: S.of(context).rules,
                onLeftBtnTap: () => Navigator.pushNamed(context, '/setRules'),
                onRightBtnTap: () {
                  if (!setState.isSinglePlayer &&
                      setState.players.length < GameMinPlayers.set) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 5),
                        content: Text(
                            '${S.of(context).theNumberOfPlayersShouldBe} ${RulesConst.setPlayers}'),
                      ),
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      '/setGame',
                      arguments: {
                        'players': setState.isSinglePlayer
                            ? [Player(name: 'Player', score: 0, id: 1)]
                            : setState.players,
                        'isSinglePlayer': setState.isSinglePlayer,
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
    final bloc = context.read<SetBloc>();

    ModalWindowWidget.show(
      context,
      mainText: S.of(context).youHaveAnUnfinishedGame,
      button1Text: S.of(context).newGame,
      button2Text: S.of(context).continueTitle,
      button1Action: () {
        bloc.deleteSavedGame();
        Navigator.pop(context);
      },
      button2Action: () {
        bloc.loadSavedGame();

        Navigator.pop(context);

        Navigator.pushNamed(context, '/setGame');
      },
    );
  }

  Widget _buildModeOption(
      BuildContext context, String modeName, SetStartScreenState state) {
    final theme = UIThemes.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.read<SetBloc>().add(SelectGameMode(modeName));
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
