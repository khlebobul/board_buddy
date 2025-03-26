import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/features/games/muncknin/widgets/munchkin_modifiers_bs.dart';
import 'package:board_buddy/features/games/muncknin/widgets/munchkin_score_widget.dart';
import 'package:board_buddy/features/games/muncknin/widgets/info_munchkin_dialog_widget.dart';
import 'package:board_buddy/features/games/muncknin/bloc/munchkin_bloc.dart';
import 'package:board_buddy/shared/widgets/game_widgets/dice_modal.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_indicator.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/features/games/common_counter/widgets/game_end_common_counter_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:use_scramble/use_scramble.dart';

/// munchkin game screen
class MunchkinGame extends StatefulWidget {
  final List<Player> players;
  final bool isSinglePlayer;

  const MunchkinGame({
    super.key,
    required this.players,
    required this.isSinglePlayer,
  });

  @override
  State<MunchkinGame> createState() => _MunchkinGameState();
}

class _MunchkinGameState extends State<MunchkinGame> {
  late final PageController _pageController;
  int _currentPlayerIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlocProvider(
      create: (context) => MunchkinBloc()
        ..add(InitializeGameScreen(
          players: widget.players,
          isSinglePlayer: widget.isSinglePlayer,
        )),
      child: BlocBuilder<MunchkinBloc, MunchkinState>(
        builder: (context, state) {
          if (state is MunchkinGameState) {
            return Scaffold(
              appBar: CustomAppBar(
                leftButtonText: S.of(context).menu,
                onLeftButtonPressed: () =>
                    Navigator.pushNamed(context, '/home'),
                isRules: true,
                rightButtonText: S.of(context).rules,
                onRightButtonPressed: () =>
                    Navigator.pushNamed(context, '/munchkinRules'),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: GeneralConst.paddingHorizontal),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () => DiceModal.show(context),
                          child: SvgPicture.asset(
                            CustomIcons.dice,
                            width: 27,
                            height: 27,
                            // ignore: deprecated_member_use
                            color: theme.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (state.players.length > 1) ...[
                    _buildMultiPlayerView(context, state),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            final currentPlayer = _currentPlayerIndex;
                            if (currentPlayer >= 0 &&
                                currentPlayer < state.players.length) {
                              context
                                  .read<MunchkinBloc>()
                                  .add(TogglePlayerGender(currentPlayer));
                            }
                          },
                          child: SvgPicture.asset(
                            state.players[_currentPlayerIndex].isMale
                                ? CustomIcons.male
                                : CustomIcons.female,
                          ),
                        ),
                        const SizedBox(width: 40),
                        GestureDetector(
                          onTap: () {
                            final currentPlayer = _currentPlayerIndex;
                            if (currentPlayer >= 0 &&
                                currentPlayer < state.players.length) {
                              context
                                  .read<MunchkinBloc>()
                                  .add(TogglePlayerCursed(currentPlayer));
                            }
                          },
                          child: Text(
                            state.players[_currentPlayerIndex].isCursed
                                ? S.of(context).cursed
                                : S.of(context).clearance,
                            style:
                                theme.display2.copyWith(color: theme.redColor),
                          ),
                        ),
                        const SizedBox(width: 40),
                        GestureDetector(
                          onTap: () {
                            // Reset player modifiers according to Munchkin rules
                            final currentPlayer = _currentPlayerIndex;
                            if (currentPlayer >= 0 &&
                                currentPlayer < state.players.length) {
                              context
                                  .read<MunchkinBloc>()
                                  .add(ResetPlayerModifiers(currentPlayer));
                            }
                          },
                          child: SvgPicture.asset(CustomIcons.bone),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        final bloc = context.read<MunchkinBloc>();

                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => MunchkinModifiersBottomSheet(
                            playerIndex: _currentPlayerIndex,
                            player: state.players[_currentPlayerIndex],
                            onModifierUpdated:
                                (playerIndex, modifierType, value) {
                              bloc.add(
                                UpdatePlayerModifier(
                                  playerIndex: playerIndex,
                                  modifierType: modifierType,
                                  value: value,
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: TextScramble(
                        text: S.of(context).modifiers,
                        style: theme.display2.copyWith(color: theme.redColor),
                      ),
                    ),
                  ] else
                    _buildSinglePlayerView(context, state),
                ],
              ),
              bottomNavigationBar: BottomGameBar(
                dialogWidget: state.players.length > 1
                    ? const InfoMunchkinDialogWidget()
                    : null,
                isArrow: true,
                rightButtonText: S.of(context).finish,
                onRightBtnTap: () => _showEndGameModal(context, state),
                isLeftArrowActive: state.history
                    .where((item) =>
                        item.playerIndex ==
                        (state.players.length > 1 ? _currentPlayerIndex : 0))
                    .isNotEmpty,
                isRightArrowActive: state.redoHistory
                    .where((item) =>
                        item.playerIndex ==
                        (state.players.length > 1 ? _currentPlayerIndex : 0))
                    .isNotEmpty,
                onLeftArrowTap: state.history
                        .where((item) =>
                            item.playerIndex ==
                            (state.players.length > 1
                                ? _currentPlayerIndex
                                : 0))
                        .isNotEmpty
                    ? () {
                        context.read<MunchkinBloc>().add(UndoAction(
                            state.players.length > 1
                                ? _currentPlayerIndex
                                : 0));
                      }
                    : null,
                onRightArrowTap: state.redoHistory
                        .where((item) =>
                            item.playerIndex ==
                            (state.players.length > 1
                                ? _currentPlayerIndex
                                : 0))
                        .isNotEmpty
                    ? () {
                        context.read<MunchkinBloc>().add(RedoAction(
                            state.players.length > 1
                                ? _currentPlayerIndex
                                : 0));
                      }
                    : null,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _showEndGameModal(BuildContext context, MunchkinGameState state) {
    // Calculate total score for each player (level + gear)
    for (var player in state.players) {
      player.score = player.level + player.gear;
    }

    // Determine if it's a single player game
    final bool isSinglePlayer = state.isSinglePlayer;

    GameEndCommonCounterModal.show(
      context,
      players: state.players,
      isSinglePlayer: isSinglePlayer,
      onContinue: () {
        Navigator.of(context).pop(); // Close the modal
      },
      onNewRound: () {
        Navigator.of(context).pop(); // Close the modal
        // Reset scores but keep the same players
        context.read<MunchkinBloc>().add(
              InitializeGameScreen(
                players: state.players,
                isSinglePlayer: state.isSinglePlayer,
              ),
            );
      },
      onNewGame: () {
        Navigator.of(context).pop(); // Close the modal
        Navigator.of(context).pop(); // Return to start screen
        Navigator.pushNamed(context, '/munchkinStartGame');
      },
      onReturnToMenu: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
      },
    );
  }

  Widget _buildMultiPlayerView(BuildContext context, MunchkinGameState state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: state.players.length,
              pageSnapping: true,
              padEnds: true,
              onPageChanged: (index) {
                setState(() {
                  _currentPlayerIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: GeneralConst.paddingHorizontal / 2,
                  ),
                  child: MunchkinScoreWidget(
                    playerName: state.players[index].name,
                    totalScore: state.players[index].score,
                    gearScore: state.players[index].gear,
                    level: state.players[index].level,
                    onIncrease: (scoreType) {
                      if (scoreType == 0) {
                        context.read<MunchkinBloc>().add(IncreaseGear(index));
                      } else {
                        context.read<MunchkinBloc>().add(IncreaseLevel(index));
                      }
                    },
                    onDecrease: (scoreType) {
                      if (scoreType == 0) {
                        context.read<MunchkinBloc>().add(DecreaseGear(index));
                      } else {
                        context.read<MunchkinBloc>().add(DecreaseLevel(index));
                      }
                    },
                    isSinglePlayer: false,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: state.players.asMap().entries.map((entry) {
              final index = entry.key;
              final player = entry.value;
              final firstLetter = player.name.characters.first;
              return GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: PlayerIndicator(
                    letter: firstLetter,
                    isActive: index == _currentPlayerIndex,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSinglePlayerView(BuildContext context, MunchkinGameState state) {
    final theme = UIThemes.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.4,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: GeneralConst.paddingHorizontal),
              child: MunchkinScoreWidget(
                playerName: state.players.first.name,
                totalScore: state.players.first.score,
                gearScore: state.players.first.gear,
                level: state.players.first.level,
                onIncrease: (scoreType) {
                  if (scoreType == 0) {
                    context.read<MunchkinBloc>().add(IncreaseGear(0));
                  } else {
                    context.read<MunchkinBloc>().add(IncreaseLevel(0));
                  }
                },
                onDecrease: (scoreType) {
                  if (scoreType == 0) {
                    context.read<MunchkinBloc>().add(DecreaseGear(0));
                  } else {
                    context.read<MunchkinBloc>().add(DecreaseLevel(0));
                  }
                },
                isSinglePlayer: true,
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.read<MunchkinBloc>().add(TogglePlayerGender(0));
              },
              child: SvgPicture.asset(
                state.players.first.isMale
                    ? CustomIcons.male
                    : CustomIcons.female,
              ),
            ),
            const SizedBox(width: 40),
            GestureDetector(
              onTap: () {
                context.read<MunchkinBloc>().add(TogglePlayerCursed(0));
              },
              child: TextScramble(
                text: state.players.first.isCursed
                    ? S.of(context).cursed
                    : S.of(context).clearance,
                style: theme.display2.copyWith(color: theme.redColor),
              ),
            ),
            const SizedBox(width: 40),
            GestureDetector(
              onTap: () {
                // Reset player modifiers according to Munchkin rules
                context.read<MunchkinBloc>().add(ResetPlayerModifiers(0));
              },
              child: SvgPicture.asset(CustomIcons.bone),
            ),
          ],
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            // Save player modifiers
            final bloc = context.read<MunchkinBloc>();

            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => MunchkinModifiersBottomSheet(
                playerIndex: 0,
                player: state.players.first,
                onModifierUpdated: (playerIndex, modifierType, value) {
                  bloc.add(
                    UpdatePlayerModifier(
                      playerIndex: playerIndex,
                      modifierType: modifierType,
                      value: value,
                    ),
                  );
                },
              ),
            );
          },
          child: TextScramble(
            text: S.of(context).modifiers,
            style: theme.display2.copyWith(color: theme.redColor),
          ),
        ),
      ],
    );
  }
}

/// Wrapper for the MunchkinGame that extracts arguments from the route
class MunchkinGameWrapper extends StatelessWidget {
  final List<Player>? players;
  final bool? isSinglePlayer;

  const MunchkinGameWrapper({
    super.key,
    this.players,
    this.isSinglePlayer,
  });

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final List<Player> finalPlayers = players ??
        args?['players'] ??
        [Player(name: 'Player', score: 0, id: 1)];
    final bool finalIsSinglePlayer =
        isSinglePlayer ?? args?['isSinglePlayer'] ?? true;

    return MunchkinGame(
      players: finalPlayers,
      isSinglePlayer: finalIsSinglePlayer,
    );
  }
}
