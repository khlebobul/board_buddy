import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/features/games/uno/bloc/uno_bloc.dart';
import 'package:board_buddy/shared/widgets/ui/add_player_dialog.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_scramble/use_scramble.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class UnoStartScreen extends StatelessWidget {
  const UnoStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UnoBloc()..add(InitializeUnoStartScreen()),
      child: const UnoStartScreenView(),
    );
  }
}

class UnoStartScreenView extends StatelessWidget {
  const UnoStartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UnoBloc, UnoState>(
      listener: (context, state) {
        if (state is UnoStartScreenState && state.hasSavedGame) {
          _showContinueGameDialog(context);
        }
      },
      builder: (context, state) {
        if (state is! UnoStartScreenState) {
          return const Center(child: CircularProgressIndicator());
        }

        final unoState = state;
        final theme = UIThemes.of(context);

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: CustomAppBar(
              leftButtonText: S.of(context).back,
              onLeftButtonPressed: () => Navigator.pop(context),
              rightButtonText: S.of(context).uno,
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
                          context, S.of(context).highestScoreWins, unoState),
                      _buildModeOption(
                          context, S.of(context).lowestScoreWins, unoState),
                      const SizedBox(height: 12),

                      // score limit (WheelChooser)
                      Text(
                        S.of(context).score,
                        style: theme.display2
                            .copyWith(color: theme.secondaryTextColor),
                      ),
                      SizedBox(
                        height: 100,
                        child: WheelChooser.integer(
                          onValueChanged: (value) => context
                              .read<UnoBloc>()
                              .add(UpdateScoreLimit(value)),
                          maxValue: 1000,
                          minValue: 100,
                          step: 50,
                          initValue: unoState.scoreLimit,
                          horizontal: true,
                          unSelectTextStyle: theme.display6
                              .copyWith(color: theme.secondaryTextColor),
                          selectTextStyle: theme.display6,
                          itemSize: 70,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // players list
                      Text(
                        S.of(context).players,
                        style: theme.display2
                            .copyWith(color: theme.secondaryTextColor),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: unoState.players.asMap().entries.map((entry) {
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
                                      .read<UnoBloc>()
                                      .add(RemovePlayer(entry.key));
                                },
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      if (unoState.players.length < GameMaxPlayers.uno)
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            final unoBloc = context.read<UnoBloc>();
                            showDialog(
                              context: context,
                              builder: (dialogContext) => AddPlayerDialog(
                                onPlayerAdded: (player) {
                                  unoBloc.add(AddPlayer(player));
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
                              }),
                        ),

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
                leftButtonText: S.of(context).rules,
                rightButtonText: S.of(context).play,
                isRightBtnRed: true,
                onLeftBtnTap: () => Navigator.pushNamed(context, '/unoRules'),
                onRightBtnTap: () {
                  unoState.players.length < GameMinPlayers.uno
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            duration: const Duration(seconds: 5),
                            content: Text(
                                '${S.of(context).theNumberOfPlayersShouldBe} ${RulesConst.unoPlayers}'),
                          ),
                        )
                      : Navigator.pushNamed(
                          context,
                          '/unoGame',
                          arguments: {
                            'players': unoState.players,
                            'scoreLimit': unoState.scoreLimit,
                            'gameMode': unoState.selectedMode,
                          },
                        );
                }),
            resizeToAvoidBottomInset: true,
          ),
        );
      },
    );
  }

  void _showContinueGameDialog(BuildContext context) {
    final bloc = context.read<UnoBloc>();

    ModalWindowWidget.showContinueGameDialog(
      context,
      onNewGame: () => bloc.deleteSavedGame(),
      onContinue: () {
        // Navigate to game screen with empty parameters
        // This will trigger LoadSavedGame in the game screen
        Navigator.pushNamed(
          context,
          '/unoGame',
          arguments: {
            'players': <Player>[],
            'scoreLimit': 0,
            'gameMode': '',
          },
        );
      },
    );
  }

  Widget _buildModeOption(
      BuildContext context, String modeName, UnoStartScreenState state) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.read<UnoBloc>().add(SelectGameMode(modeName));
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
}
