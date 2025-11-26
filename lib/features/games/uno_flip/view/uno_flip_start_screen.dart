import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/uno_flip/bloc/uno_flip_bloc.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/ui/add_player_dialog.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_scramble/use_scramble.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class UnoFlipStartScreen extends StatelessWidget {
  const UnoFlipStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UnoFlipBloc()..add(InitializeUnoFlipStartScreen()),
      child: const UnoFlipStartScreenView(),
    );
  }
}

class UnoFlipStartScreenView extends StatelessWidget {
  const UnoFlipStartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UnoFlipBloc, UnoFlipState>(
      listener: (context, state) {
        if (state is UnoFlipStartScreenState && state.hasSavedGame) {
          _showContinueGameDialog(context);
        }
      },
      builder: (context, state) {
        if (state is! UnoFlipStartScreenState) {
          return const Center(child: CircularProgressIndicator());
        }

        final unoFlipState = state;
        final theme = UIThemes.of(context);

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: CustomAppBar(
              leftButtonText: S.of(context).back,
              onLeftButtonPressed: () => Navigator.pop(context),
              rightButtonText: S.of(context).unoFlip,
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
                      _buildModeOption(context, S.of(context).highestScoreWins,
                          unoFlipState),
                      _buildModeOption(
                          context, S.of(context).lowestScoreWins, unoFlipState),
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
                              .read<UnoFlipBloc>()
                              .add(UpdateScoreLimit(value)),
                          maxValue: 1000,
                          minValue: 100,
                          step: 50,
                          initValue: unoFlipState.scoreLimit,
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
                        children:
                            unoFlipState.players.asMap().entries.map((entry) {
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
                                      .read<UnoFlipBloc>()
                                      .add(RemovePlayer(entry.key));
                                },
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      if (unoFlipState.players.length < GameMaxPlayers.unoFlip)
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            final unoFlipBloc = context.read<UnoFlipBloc>();
                            showDialog(
                              context: context,
                              builder: (dialogContext) => AddPlayerDialog(
                                onPlayerAdded: (player) {
                                  unoFlipBloc.add(AddPlayer(player));
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
                onLeftBtnTap: () =>
                    Navigator.pushNamed(context, '/unoFlipRules'),
                onRightBtnTap: () {
                  unoFlipState.players.length < GameMinPlayers.unoFlip
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            duration: const Duration(seconds: 5),
                            content: Text(
                                '${S.of(context).theNumberOfPlayersShouldBe} ${RulesConst.unoFlipPlayers}'),
                          ),
                        )
                      : Navigator.pushNamed(
                          context,
                          '/unoFlipGame',
                          arguments: {
                            'players': unoFlipState.players,
                            'scoreLimit': unoFlipState.scoreLimit,
                            'gameMode': unoFlipState.selectedMode,
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
    final bloc = context.read<UnoFlipBloc>();

    ModalWindowWidget.showContinueGameDialog(
      context,
      onNewGame: () => bloc.deleteSavedGame(),
      onContinue: () {
        bloc.loadSavedGame();
        Navigator.pushNamed(context, '/unoFlipGame');
      },
    );
  }

  Widget _buildModeOption(
      BuildContext context, String modeName, UnoFlipStartScreenState state) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.read<UnoFlipBloc>().add(SelectGameMode(modeName));
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
