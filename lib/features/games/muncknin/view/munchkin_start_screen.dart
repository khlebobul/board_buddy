import 'package:board_buddy/features/games/muncknin/bloc/munchkin_bloc.dart';
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

class MunchkinStartScreen extends StatelessWidget {
  const MunchkinStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MunchkinBloc()..add(InitializeMunchkinStartScreen()),
      child: const MunchkinStartScreenView(),
    );
  }
}

class MunchkinStartScreenView extends StatefulWidget {
  const MunchkinStartScreenView({super.key});

  @override
  State<MunchkinStartScreenView> createState() =>
      _MunchkinStartScreenViewState();
}

class _MunchkinStartScreenViewState extends State<MunchkinStartScreenView> {
  bool _hasSavedGameDialogShown = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MunchkinBloc, MunchkinState>(
      listener: (context, state) {
        if (state is MunchkinStartScreenState &&
            state.hasSavedGame &&
            !_hasSavedGameDialogShown) {
          _hasSavedGameDialogShown = true;
          _showContinueGameDialog(context);
        } else if (state is MunchkinGameState && state.isRestoredGame) {
          Navigator.pushNamed(
            context,
            '/munchkinGame',
            arguments: {
              'players': state.players,
              'isSinglePlayer': state.isSinglePlayer,
            },
          );
        }
      },
      builder: (context, state) {
        if (state is! MunchkinStartScreenState) {
          return const Center(child: CircularProgressIndicator());
        }

        final munchkinState = state;
        final theme = UIThemes.of(context);

        return Scaffold(
          appBar: CustomAppBar(
            leftButtonText: S.of(context).back,
            onLeftButtonPressed: () => Navigator.pop(context),
            rightButtonText: S.of(context).munchkin,
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
                        context, S.of(context).singleplayer, munchkinState),
                    _buildModeOption(
                        context, S.of(context).multiplayer, munchkinState),
                    const SizedBox(height: 24),

                    // players list - only show in multiplayer mode
                    if (!munchkinState.isSinglePlayer) ...[
                      Text(
                        S.of(context).players,
                        style: theme.display2
                            .copyWith(color: theme.secondaryTextColor),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            munchkinState.players.asMap().entries.map((entry) {
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
                                      .read<MunchkinBloc>()
                                      .add(RemovePlayer(entry.key));
                                },
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      if (munchkinState.players.length <
                          GameMaxPlayers.munchkin)
                        GestureDetector(
                          onTap: () {
                            final munchkinBloc = context.read<MunchkinBloc>();
                            showDialog(
                              context: context,
                              builder: (dialogContext) => AddPlayerDialog(
                                onPlayerAdded: (player) {
                                  munchkinBloc.add(AddPlayer(player));
                                },
                              ),
                            );
                          },
                          child: TextScramble(
                            text: S.of(context).add,
                            style:
                                theme.display2.copyWith(color: theme.redColor),
                          ),
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
              onLeftBtnTap: () =>
                  Navigator.pushNamed(context, '/munchkinRules'),
              onRightBtnTap: () {
                if (!munchkinState.isSinglePlayer &&
                    munchkinState.players.length < GameMinPlayers.munchkin) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          '${S.of(context).theNumberOfPlayersShouldBe} ${RulesConst.munchkinPlayers}'),
                    ),
                  );
                } else {
                  Navigator.pushNamed(
                    context,
                    '/munchkinGame',
                    arguments: {
                      'players': munchkinState.isSinglePlayer
                          ? [Player(name: 'Player', score: 0, id: 1)]
                          : munchkinState.players,
                      'isSinglePlayer': munchkinState.isSinglePlayer,
                    },
                  );
                }
              }),
          resizeToAvoidBottomInset: true,
        );
      },
    );
  }

  void _showContinueGameDialog(BuildContext context) {
    final bloc = context.read<MunchkinBloc>();

    ModalWindowWidget.show(
      context,
      mainText: S.of(context).youHaveAnUnfinishedGame,
      button1Text: S.of(context).newGame,
      button2Text: S.of(context).continueTitle,
      button1Action: () {
        bloc.add(DeleteSavedGame());
        Navigator.pop(context);
      },
      button2Action: () {
        bloc.add(LoadSavedGame());
        Navigator.pop(context);
      },
    );
  }

  Widget _buildModeOption(
      BuildContext context, String modeName, MunchkinStartScreenState state) {
    final theme = UIThemes.of(context);

    return GestureDetector(
      onTap: () {
        context.read<MunchkinBloc>().add(SelectGameMode(modeName));
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
            style: theme.display2,
          ),
        ],
      ),
    );
  }
}
