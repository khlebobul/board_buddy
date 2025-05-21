import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/features/games/carcassonne/bloc/carcassonne_bloc.dart';
import 'package:board_buddy/features/games/carcassonne/view/carcassonne_automatic_mode.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/ui/add_player_dialog.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_scramble/use_scramble.dart';

class CarcassonneStartScreen extends StatelessWidget {
  const CarcassonneStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CarcassonneBloc()..add(InitializeCarcassonneStartScreen()),
      child: const CarcassonneStartScreenView(),
    );
  }
}

class CarcassonneStartScreenView extends StatelessWidget {
  const CarcassonneStartScreenView({super.key});

  String _getModeString(BuildContext context, String mode) {
    return mode == 'manual' ? S.of(context).manual : S.of(context).automatic;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarcassonneBloc, CarcassonneState>(
      listener: (context, state) {
        if (state is CarcassonneStartScreenState && state.hasSavedGame) {
          _showContinueGameDialog(context);
        }
      },
      builder: (context, state) {
        if (state is! CarcassonneStartScreenState) {
          return const Center(child: CircularProgressIndicator());
        }

        final carcassonneState = state;
        final theme = UIThemes.of(context);

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: CustomAppBar(
              leftButtonText: S.of(context).back,
              onLeftButtonPressed: () => Navigator.pop(context),
              rightButtonText: S.of(context).carcassonne,
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
                      Text(
                        S.of(context).mode,
                        style: theme.display2
                            .copyWith(color: theme.secondaryTextColor),
                      ),
                      _buildModeOption(
                        context,
                        'manual',
                        carcassonneState,
                      ),
                      _buildModeOption(
                        context,
                        'automatic',
                        carcassonneState,
                      ),
                      const SizedBox(height: 24),

                      // Players list - only show in manual mode
                      if (!carcassonneState.isAutomatic) ...[
                        Text(
                          S.of(context).players,
                          style: theme.display2
                              .copyWith(color: theme.secondaryTextColor),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: carcassonneState.players
                              .asMap()
                              .entries
                              .map((entry) {
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
                                        .read<CarcassonneBloc>()
                                        .add(RemovePlayer(entry.key));
                                  },
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 12),
                        if (carcassonneState.players.length <
                            GameMaxPlayers.carcassonne)
                          GestureDetector(
                            onTap: () {
                              final bloc = context.read<CarcassonneBloc>();
                              showDialog(
                                context: context,
                                builder: (dialogContext) => AddPlayerDialog(
                                  onPlayerAdded: (player) {
                                    bloc.add(AddPlayer(player));
                                  },
                                ),
                              );
                            },
                            child: TextScramble(
                              text: S.of(context).add,
                              builder: (context, scrambledText) {
                                return Text(
                                  scrambledText,
                                  style: theme.display2
                                      .copyWith(color: theme.redColor),
                                );
                              },
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
                  Navigator.pushNamed(context, '/carcassonneRules'),
              onRightBtnTap: () {
                if (carcassonneState.isAutomatic) {
                  // Navigate to automatic mode screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CarcassonneAutomaticMode(),
                    ),
                  );
                } else if (carcassonneState.players.length <
                    GameMinPlayers.carcassonne) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 5),
                      content: Text(
                          '${S.of(context).theNumberOfPlayersShouldBe} ${RulesConst.carcassonnePlayers}'),
                    ),
                  );
                } else {
                  Navigator.pushNamed(
                    context,
                    '/carcassonneGame',
                    arguments: {
                      'isAutomatic': carcassonneState.isAutomatic,
                      'players': carcassonneState.players,
                    },
                  );
                }
              },
            ),
            resizeToAvoidBottomInset: true,
          ),
        );
      },
    );
  }

  Widget _buildModeOption(
    BuildContext context,
    String mode,
    CarcassonneStartScreenState state,
  ) {
    final theme = UIThemes.of(context);

    return GestureDetector(
      onTap: () {
        context.read<CarcassonneBloc>().add(SelectGameMode(mode));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: state.selectedMode == mode
                ? theme.redColor
                : Colors.transparent,
            radius: 3,
          ),
          const SizedBox(width: 8),
          TextScramble(
              text: _getModeString(context, mode),
              builder: (context, scrambledText) {
                return Text(
                  scrambledText,
                  style: theme.display2,
                );
              }),
        ],
      ),
    );
  }

  void _showContinueGameDialog(BuildContext context) {
    final bloc = context.read<CarcassonneBloc>();

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
        Navigator.pushNamed(context, '/carcassonneGame');
      },
    );
  }
}
