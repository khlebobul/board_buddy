import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/routes/routes.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/thousand/bloc/thousand_bloc.dart';
import 'package:board_buddy/features/games/thousand/view/thousand_game_screen.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/ui/add_player_dialog.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_scramble/use_scramble.dart';

class ThousandStartScreen extends StatelessWidget {
  const ThousandStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThousandBloc()..add(InitializeThousandStartScreen()),
      child: BlocBuilder<ThousandBloc, ThousandState>(
        builder: (context, state) {
          if (state is ThousandStartScreenState) {
            return const ThousandStartScreenContent();
          } else if (state is ThousandInitial) {
            return const ThousandStartScreenContent();
          } else {
            return const ThousandGameScreen();
          }
        },
      ),
    );
  }
}

class ThousandStartScreenContent extends StatelessWidget {
  const ThousandStartScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThousandBloc, ThousandState>(
      listener: (context, state) {
        if (state is ThousandStartScreenState && state.hasSavedGame) {
          _showContinueGameDialog(context);
        }
      },
      builder: (context, state) {
        if (state is! ThousandStartScreenState) {
          return const Center(child: CircularProgressIndicator());
        }

        final thousandState = state;
        final theme = UIThemes.of(context);

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: CustomAppBar(
              leftButtonText: S.of(context).back,
              onLeftButtonPressed: () => Navigator.pop(context),
              rightButtonText: ThousandCardsText.thousand,
              onRightButtonPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.thousandRules),
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
                        S.of(context).players,
                        style: theme.display2
                            .copyWith(color: theme.secondaryTextColor),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            thousandState.players.asMap().entries.map((entry) {
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
                                      .read<ThousandBloc>()
                                      .add(RemoveThousandPlayer(entry.key));
                                },
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      if (thousandState.players.length <
                          GameMaxPlayers.thousand)
                        GestureDetector(
                          onTap: () {
                            final thousandBloc = context.read<ThousandBloc>();
                            showDialog(
                              context: context,
                              builder: (dialogContext) => AddPlayerDialog(
                                onPlayerAdded: (player) {
                                  thousandBloc.add(AddThousandPlayer(player));
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
                  Navigator.pushNamed(context, AppRoutes.thousandRules),
              onRightBtnTap: () {
                thousandState.players.length < GameMinPlayers.thousand
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(seconds: 5),
                          content: Text(
                              '${S.of(context).theNumberOfPlayersShouldBe} ${RulesConst.thousandPlayers}'),
                        ),
                      )
                    : context.read<ThousandBloc>().add(
                          StartThousandGame(thousandState.players),
                        );
              },
            ),
            resizeToAvoidBottomInset: true,
          ),
        );
      },
    );
  }

  void _showContinueGameDialog(BuildContext context) {
    final bloc = context.read<ThousandBloc>();

    ModalWindowWidget.show(
      context,
      mainText: S.of(context).youHaveAnUnfinishedGame,
      button1Text: S.of(context).newGame,
      button2Text: S.of(context).continueTitle,
      button1Action: () {
        bloc.add(DeleteSavedThousandGame());
        Navigator.pop(context);
      },
      button2Action: () {
        bloc.add(LoadSavedThousandGame());
        Navigator.pop(context);
      },
    );
  }
}
