import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/features/games/catan/bloc/catan_bloc.dart';
import 'package:board_buddy/shared/widgets/ui/add_player_dialog.dart';
import 'package:board_buddy/shared/widgets/ui/animated_snackbar.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:board_buddy/features/games/catan/widgets/catan_map_generator_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_static_icons/not_static_icons.dart';
import 'package:use_scramble/use_scramble.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class CatanStartScreen extends StatelessWidget {
  const CatanStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatanBloc()..add(InitializeCatanStartScreen()),
      child: const CatanStartScreenView(),
    );
  }
}

class CatanStartScreenView extends StatelessWidget {
  const CatanStartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CatanBloc, CatanState>(
      listener: (context, state) {
        if (state is CatanStartScreenState && state.hasSavedGame) {
          _showContinueGameDialog(context);
        }
      },
      builder: (context, state) {
        if (state is! CatanStartScreenState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final catanState = state;
        final theme = UIThemes.of(context);

        return Scaffold(
          backgroundColor: theme.bgColor,
          appBar: CustomAppBar(
            leftButtonText: S.of(context).back,
            onLeftButtonPressed: () => Navigator.pop(context),
            rightButtonText: S.of(context).catan,
            onRightButtonPressed: () {},
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: GeneralConst.paddingHorizontal),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      S.of(context).score,
                      style: theme.display2
                          .copyWith(color: theme.secondaryTextColor),
                    ),
                    SizedBox(
                      height: 100,
                      child: WheelChooser.integer(
                        onValueChanged: (value) => context
                            .read<CatanBloc>()
                            .add(UpdateScoreLimit(value)),
                        maxValue: 20,
                        minValue: 5,
                        step: 1,
                        initValue: catanState.scoreLimit,
                        horizontal: true,
                        unSelectTextStyle: theme.display6
                            .copyWith(color: theme.secondaryTextColor),
                        selectTextStyle: theme.display6,
                        itemSize: 70,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      S.of(context).players,
                      style: theme.display2
                          .copyWith(color: theme.secondaryTextColor),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: catanState.players.asMap().entries.map((entry) {
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
                                    .read<CatanBloc>()
                                    .add(RemovePlayer(entry.key));
                              },
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 12),
                    if (catanState.players.length < GameMaxPlayers.catan)
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          final catanBloc = context.read<CatanBloc>();
                          showDialog(
                            context: context,
                            builder: (dialogContext) => AddPlayerDialog(
                              onPlayerAdded: (player) {
                                catanBloc.add(AddPlayer(player));
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
                    const SizedBox(height: 24),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const CatanMapGeneratorDialog(),
                        );
                      },
                      child: TextScramble(
                        text: S.of(context).mapGenerator,
                        builder: (context, scrambledText) {
                          return Text(
                            scrambledText,
                            style:
                                theme.display2.copyWith(color: theme.redColor),
                          );
                        },
                      ),
                    ),
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
              onLeftBtnTap: () {
                Navigator.pushNamed(context, '/catanRules');
              },
              onRightBtnTap: () {
                if (catanState.players.length < GameMinPlayers.catan) {
                  AnimatedSnackBar.show(
                    context,
                    message:
                        '${S.of(context).theNumberOfPlayersShouldBe} ${RulesConst.catanPlayers}',
                  );
                } else {
                  Navigator.pushNamed(
                    context,
                    '/catanGame',
                    arguments: {
                      'players': catanState.players,
                      'scoreLimit': catanState.scoreLimit,
                      'gameMode': catanState.selectedMode,
                    },
                  );
                }
              }),
        );
      },
    );
  }

  void _showContinueGameDialog(BuildContext context) {
    ModalWindowWidget.show(
      context,
      mainText: S.of(context).youHaveAnUnfinishedGame,
      button1Text: S.of(context).newGame,
      button2Text: S.of(context).continueTitle,
      button1Action: () {
        context.read<CatanBloc>().add(DeleteSavedGame());
        Navigator.of(context).pop();
      },
      button2Action: () {
        context.read<CatanBloc>().add(LoadSavedGame());
        Navigator.of(context).pop();
        Navigator.pushNamed(
          context,
          '/catanGame',
          arguments: {
            'players': <Player>[],
            'scoreLimit': 0,
            'gameMode': '',
          },
        );
      },
    );
  }
}
