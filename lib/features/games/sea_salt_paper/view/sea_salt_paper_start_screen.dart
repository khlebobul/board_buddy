import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/routes/routes.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/sea_salt_paper/bloc/sea_salt_paper_bloc.dart';
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

class SeaSaltPaperStartScreen extends StatelessWidget {
  const SeaSaltPaperStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SeaSaltPaperBloc()..add(InitializeSeaSaltPaperStartScreen()),
      child: const SeaSaltPaperStartScreenView(),
    );
  }
}

class SeaSaltPaperStartScreenView extends StatefulWidget {
  const SeaSaltPaperStartScreenView({super.key});

  @override
  State<SeaSaltPaperStartScreenView> createState() =>
      _SeaSaltPaperStartScreenViewState();
}

class _SeaSaltPaperStartScreenViewState
    extends State<SeaSaltPaperStartScreenView> {
  bool _hasSavedGameDialogShown = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SeaSaltPaperBloc, SeaSaltPaperState>(
      listener: (context, state) {
        if (state is SeaSaltPaperStartScreenState &&
            state.hasSavedGame &&
            !_hasSavedGameDialogShown) {
          _hasSavedGameDialogShown = true;
          _showContinueGameDialog(context);
        }
      },
      builder: (context, state) {
        if (state is! SeaSaltPaperStartScreenState) {
          return const Center(child: CircularProgressIndicator());
        }

        final seaSaltPaperState = state;
        final theme = UIThemes.of(context);

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: CustomAppBar(
              leftButtonText: S.of(context).back,
              onLeftButtonPressed: () => Navigator.pop(context),
              rightButtonText: S.of(context).seaSaltPaper,
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
                      Row(
                        children: [
                          Text(
                            S.of(context).score,
                            style: theme.display2
                                .copyWith(color: theme.secondaryTextColor),
                          ),
                          if (seaSaltPaperState.isCustomScoreLimit) ...[
                            const SizedBox(width: 8),
                            Text(
                              S.of(context).custom,
                              style: theme.display2
                                  .copyWith(color: theme.redColor),
                            ),
                          ],
                        ],
                      ),
                      KeyedSubtree(
                        key: ValueKey(
                            'wheel_${seaSaltPaperState.players.length}'),
                        child: SizedBox(
                          height: 100,
                          child: WheelChooser.integer(
                            onValueChanged: (value) => context
                                .read<SeaSaltPaperBloc>()
                                .add(UpdateSeaSaltPaperScoreLimit(value)),
                            maxValue: 60,
                            minValue: 20,
                            step: 5,
                            initValue: seaSaltPaperState.scoreLimit,
                            horizontal: true,
                            unSelectTextStyle: theme.display6
                                .copyWith(color: theme.secondaryTextColor),
                            selectTextStyle: theme.display6,
                            itemSize: 70,
                          ),
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
                        children: seaSaltPaperState.players
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
                              XIcon(
                                size: 20,
                                color: theme.secondaryTextColor,
                                strokeWidth: 1.5,
                                onTap: () {
                                  context
                                      .read<SeaSaltPaperBloc>()
                                      .add(RemoveSeaSaltPaperPlayer(entry.key));
                                },
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      if (seaSaltPaperState.players.length <
                          GameMaxPlayers.seaSaltPaper)
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            final bloc = context.read<SeaSaltPaperBloc>();
                            showDialog(
                              context: context,
                              builder: (dialogContext) => AddPlayerDialog(
                                onPlayerAdded: (player) {
                                  bloc.add(AddSeaSaltPaperPlayer(player));
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
                  Navigator.pushNamed(context, AppRoutes.seaSaltPaperRules),
              onRightBtnTap: () {
                if (seaSaltPaperState.players.length <
                    GameMinPlayers.seaSaltPaper) {
                  AnimatedSnackBar.show(
                    context,
                    message:
                        '${S.of(context).theNumberOfPlayersShouldBe} ${RulesConst.seaSaltPaperPlayers}',
                  );
                } else {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.seaSaltPaperGame,
                    arguments: {
                      'players': seaSaltPaperState.players,
                      'scoreLimit': seaSaltPaperState.scoreLimit,
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
    final bloc = context.read<SeaSaltPaperBloc>();

    ModalWindowWidget.showContinueGameDialog(
      context,
      onNewGame: () => bloc.add(DeleteSavedSeaSaltPaperGame()),
      onContinue: () {
        Navigator.pushNamed(
          context,
          AppRoutes.seaSaltPaperGame,
          arguments: {
            'players': <Player>[],
            'scoreLimit': 0,
          },
        );
      },
    );
  }
}
