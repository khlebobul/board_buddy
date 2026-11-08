import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/routes/routes.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/uno_zero/bloc/uno_zero_bloc.dart';
import 'package:board_buddy/features/games/uno_zero/models/uno_zero_scoreboard.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/ui/add_player_dialog.dart';
import 'package:board_buddy/shared/widgets/ui/animated_snackbar.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_static_icons/not_static_icons.dart';
import 'package:use_scramble/use_scramble.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class UnoZeroStartScreen extends StatelessWidget {
  const UnoZeroStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UnoZeroBloc()..add(InitializeUnoZeroStartScreen()),
      child: const UnoZeroStartScreenView(),
    );
  }
}

class UnoZeroStartScreenView extends StatefulWidget {
  const UnoZeroStartScreenView({super.key});

  @override
  State<UnoZeroStartScreenView> createState() => _UnoZeroStartScreenViewState();
}

class _UnoZeroStartScreenViewState extends State<UnoZeroStartScreenView> {
  bool _hasSavedGameDialogShown = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UnoZeroBloc, UnoZeroState>(
      listener: (context, state) {
        if (state is UnoZeroStartScreenState &&
            state.hasSavedGame &&
            !_hasSavedGameDialogShown) {
          _hasSavedGameDialogShown = true;
          _showContinueGameDialog(context);
        }
      },
      builder: (context, state) {
        if (state is! UnoZeroStartScreenState) {
          return const Center(child: CircularProgressIndicator());
        }

        final startState = state;
        final theme = UIThemes.of(context);

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: CustomAppBar(
              leftButtonText: S.of(context).back,
              onLeftButtonPressed: () => Navigator.pop(context),
              rightButtonText: GameNames.unoZero,
              onRightButtonPressed: () {},
            ),
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: GeneralConst.paddingHorizontal,
                    ) +
                    const EdgeInsets.only(top: GeneralConst.paddingVertical),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            S.of(context).unoZeroRounds,
                            style: theme.display2.copyWith(
                              color: theme.secondaryTextColor,
                            ),
                          ),
                          if (startState.isCustomRoundCount) ...[
                            const SizedBox(width: 8),
                            Text(
                              S.of(context).custom,
                              style: theme.display2.copyWith(
                                color: theme.redColor,
                              ),
                            ),
                          ],
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        child: WheelChooser.integer(
                          onValueChanged: (value) => context
                              .read<UnoZeroBloc>()
                              .add(UpdateUnoZeroRounds(value)),
                          maxValue: UnoZeroScoreboard.maxRounds,
                          minValue: UnoZeroScoreboard.minRounds,
                          initValue: startState.totalRounds,
                          horizontal: true,
                          unSelectTextStyle: theme.display6.copyWith(
                            color: theme.secondaryTextColor,
                          ),
                          selectTextStyle: theme.display6,
                          itemSize: 70,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        S.of(context).players,
                        style: theme.display2.copyWith(
                          color: theme.secondaryTextColor,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: startState.players.asMap().entries.map((
                          entry,
                        ) {
                          final index = entry.key + 1;
                          final player = entry.value;
                          final formattedIndex = index.toString().padLeft(
                            2,
                            '0',
                          );
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '$formattedIndex - ${player.name}'
                                      .toLowerCase(),
                                  softWrap: true,
                                  style: theme.display2.copyWith(
                                    color: theme.textColor,
                                  ),
                                ),
                              ),
                              XIcon(
                                size: 20,
                                color: theme.secondaryTextColor,
                                strokeWidth: 1.5,
                                onTap: () {
                                  context.read<UnoZeroBloc>().add(
                                    RemoveUnoZeroPlayer(entry.key),
                                  );
                                },
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      if (startState.players.length < GameMaxPlayers.unoZero)
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            final bloc = context.read<UnoZeroBloc>();
                            showDialog(
                              context: context,
                              builder: (dialogContext) => AddPlayerDialog(
                                onPlayerAdded: (player) {
                                  bloc.add(AddUnoZeroPlayer(player));
                                },
                              ),
                            );
                          },
                          child: TextScramble(
                            text: S.of(context).add,
                            builder: (context, scrambledText) => Text(
                              scrambledText,
                              style: theme.display2.copyWith(
                                color: theme.redColor,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom > 0
                            ? 300
                            : 0,
                      ),
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
                  Navigator.pushNamed(context, AppRoutes.unoZeroRules),
              onRightBtnTap: () {
                if (startState.players.length < GameMinPlayers.unoZero) {
                  AnimatedSnackBar.show(
                    context,
                    message:
                        '${S.of(context).theNumberOfPlayersShouldBe} ${RulesConst.unoZeroPlayers}',
                  );
                } else {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.unoZeroGame,
                    arguments: {
                      'players': startState.players,
                      'totalRounds': startState.totalRounds,
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

  void _showContinueGameDialog(BuildContext context) {
    final bloc = context.read<UnoZeroBloc>();

    ModalWindowWidget.showContinueGameDialog(
      context,
      onNewGame: () => bloc.add(DeleteSavedUnoZeroGame()),
      onContinue: () {
        Navigator.pushNamed(
          context,
          AppRoutes.unoZeroGame,
          arguments: {
            'players': <Player>[],
            'totalRounds': UnoZeroScoreboard.defaultRounds,
          },
        );
      },
    );
  }
}
