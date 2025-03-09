import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/features/games/common_counter/bloc/common_counter_bloc.dart';
import 'package:board_buddy/features/games/common_counter/widgets/game_end_common_counter_modal.dart';
import 'package:board_buddy/features/games/common_counter/widgets/custom_score_keyboard.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/game_widgets/dice_modal.dart';
import 'package:board_buddy/shared/widgets/game_widgets/timer.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_score_widget.dart';
import 'package:board_buddy/shared/widgets/game_widgets/player_card.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

/// common game screen (calculator)
class CommonGame extends StatelessWidget {
  final List<Player> players;
  final bool isSinglePlayer;

  const CommonGame({
    required this.players,
    required this.isSinglePlayer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommonCounterBloc()
        ..add(InitializeGameScreen(
          players: players,
          isSinglePlayer: isSinglePlayer,
        )),
      child: const CommonGameView(),
    );
  }
}

class CommonGameView extends StatefulWidget {
  const CommonGameView({super.key});

  @override
  State<CommonGameView> createState() => _CommonGameViewState();
}

class _CommonGameViewState extends State<CommonGameView>
    with TickerProviderStateMixin {
  late final PageController _pageController;
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutQuad,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _updateScore(BuildContext context, int playerIndex, int value) {
    final bloc = context.read<CommonCounterBloc>();

    if (value > 0) {
      bloc.add(IncreaseScoreBy(playerIndex, value));
    } else if (value < 0) {
      bloc.add(DecreaseScoreBy(playerIndex, -value));
    }

    // Start animation
    _animationController.reset();
    _animationController.forward().then((_) {
      bloc.add(ResetScoreAnimation());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommonCounterBloc, CommonCounterState>(
      builder: (context, state) {
        if (state is! CommonCounterGameState) {
          return const Center(child: CircularProgressIndicator());
        }

        final gameState = state;
        final theme = UIThemes.of(context);

        return Scaffold(
          appBar: CustomAppBar(
            leftButtonText: S.of(context).back,
            onLeftButtonPressed: () => Navigator.pop(context),
            rightButtonText: S.of(context).common,
            onRightButtonPressed: () {},
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                      horizontal: GeneralConst.paddingHorizontal) +
                  const EdgeInsets.only(top: GeneralConst.paddingVertical),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TimerWidget(),
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
                  const SizedBox(height: 20),
                  Expanded(
                    child: gameState.isSinglePlayer
                        ? _buildSinglePlayerView(context, gameState)
                        : _buildMultiPlayerView(context, gameState, theme),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomGameBar(
            isArrow: true,
            rightButtonText: S.of(context).finish,
            onRightBtnTap: () {
              _showGameEndModal(context, gameState);
            },
            isLeftArrowActive: gameState.history.isNotEmpty,
            isRightArrowActive: gameState.redoHistory.isNotEmpty,
            onLeftArrowTap: gameState.history.isNotEmpty
                ? () {
                    context.read<CommonCounterBloc>().add(UndoAction());
                  }
                : null,
            onRightArrowTap: gameState.redoHistory.isNotEmpty
                ? () {
                    context.read<CommonCounterBloc>().add(RedoAction());
                  }
                : null,
            onKeyboardBtnTap: () {},
            isKeyboardActive: gameState.isSinglePlayer ? false : true,
          ),
        );
      },
    );
  }

  Widget _buildSinglePlayerView(
      BuildContext context, CommonCounterGameState gameState) {
    return Center(
      child: SingleChildScrollView(
        child: PlayersScoreWidget(
          players: gameState.players,
          onIncrease: (index) {
            context.read<CommonCounterBloc>().add(IncreaseScore(index));
          },
          onDecrease: (index) {
            context.read<CommonCounterBloc>().add(DecreaseScore(index));
          },
        ),
      ),
    );
  }

  Widget _buildMultiPlayerView(
      BuildContext context, CommonCounterGameState gameState, UIThemes theme) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: gameState.players.length,
                      pageSnapping: true,
                      padEnds: true,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: GeneralConst.paddingHorizontal / 2,
                          ),
                          child: PlayerCard(
                            player: gameState.players[index],
                          ),
                        );
                      },
                    ),

                    // Animation for score change
                    if (gameState.isScoreChanging)
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Positioned(
                            top: 60 - (_animation.value * 40),
                            left: 0,
                            right: 0,
                            child: Opacity(
                              opacity: 1.0 - _animation.value,
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  child: Text(
                                    gameState.lastScoreChange > 0
                                        ? '+${gameState.lastScoreChange}'
                                        : '${gameState.lastScoreChange}',
                                    style: theme.display2.copyWith(
                                      color: theme.secondaryTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: gameState.players.asMap().entries.map((entry) {
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
                        isActive: index == _currentPageIndex,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        const Spacer(),
        CustomScoreKeyboard(
          onValueSelected: (value) {
            _updateScore(context, _currentPageIndex, value);
          },
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  void _showGameEndModal(
      BuildContext context, CommonCounterGameState gameState) {
    GameEndCommonCounterModal.show(
      context,
      players: gameState.players,
      isSinglePlayer: gameState.isSinglePlayer,
      onContinue: () {
        Navigator.of(context).pop(); // Close the modal
      },
      onNewRound: () {
        Navigator.of(context).pop(); // Close the modal
        context.read<CommonCounterBloc>().add(ResetScores());
      },
      onNewGame: () {
        Navigator.of(context).pop(); // Close the modal
        Navigator.of(context).pop(); // Return to start screen
        Navigator.pushNamed(context, '/commonStartGame');
      },
      onReturnToMenu: () {
        Navigator.pushNamed(context, '/home');
      },
    );
  }
}
