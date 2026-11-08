import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/common/utils/game_end_modal_helper.dart';
import 'package:board_buddy/features/games/uno_zero/bloc/uno_zero_bloc.dart';
import 'package:board_buddy/features/games/uno_zero/widgets/info_uno_zero_dialog.dart';
import 'package:board_buddy/features/games/uno_zero/widgets/uno_zero_keyboard.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/game_widgets/player_card.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_indicator.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnoZeroGame extends StatefulWidget {
  final List<Player> players;
  final int totalRounds;

  const UnoZeroGame({
    super.key,
    required this.players,
    required this.totalRounds,
  });

  @override
  State<UnoZeroGame> createState() => _UnoZeroGameState();
}

class _UnoZeroGameState extends State<UnoZeroGame> {
  late final PageController _pageController;
  final Map<int, String> _buffers = {};
  int _currentPageIndex = 0;
  bool _isInitialized = false;
  bool _isGameEndModalShown = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.85);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isInitialized) return;
      final bloc = context.read<UnoZeroBloc>();
      if (widget.players.isEmpty) {
        bloc.add(LoadSavedUnoZeroGame());
      } else {
        bloc.add(
          InitializeUnoZeroGame(
            players: widget.players,
            totalRounds: widget.totalRounds,
          ),
        );
      }
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _pushDigit(String digit) {
    setState(() {
      final current = _buffers[_currentPageIndex] ?? '';
      if (current == '0') {
        _buffers[_currentPageIndex] = digit;
      } else if (current.length < 3) {
        _buffers[_currentPageIndex] = '$current$digit';
      }
    });
  }

  void _backspace() {
    setState(() {
      final current = _buffers[_currentPageIndex] ?? '';
      if (current.isEmpty) return;
      _buffers[_currentPageIndex] = current.substring(0, current.length - 1);
    });
  }

  void _confirmScore() {
    final raw = _buffers[_currentPageIndex] ?? '';
    if (raw.isEmpty) return;
    context.read<UnoZeroBloc>().add(
      EnterUnoZeroScore(_currentPageIndex, int.parse(raw)),
    );
    setState(() => _buffers[_currentPageIndex] = '');
  }

  void _showGameEndModal(UnoZeroGameState gameState) {
    if (_isGameEndModalShown) return;
    _isGameEndModalShown = true;

    final bloc = context.read<UnoZeroBloc>();
    if (gameState.gameEnded) {
      bloc.add(MarkUnoZeroGameEndModalShown());
    }

    GameEndModalHelper.showUnoStyleModal(
      context: context,
      players: gameState.players,
      gameMode: S.of(context).lowestScoreWins,
      scoreLimit: gameState.scoreboard.totalRounds,
      maxPlayers: gameState.players.length,
      highlightTies: true,
      onContinueGame: () {
        bloc.add(ContinueUnoZeroGame());
        _isGameEndModalShown = false;
      },
      onNewGameWithSamePlayers: () {
        bloc.add(StartNewUnoZeroGameWithSamePlayers());
        _buffers.clear();
        _isGameEndModalShown = false;
      },
      onNewGame: () {
        bloc.add(DeleteSavedUnoZeroGame());
        _isGameEndModalShown = false;
      },
      onReturnToMenu: () => _isGameEndModalShown = false,
      onAddPlayerToBloc: (_) {},
      onReopenModal: (_, __, ___) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlocConsumer<UnoZeroBloc, UnoZeroState>(
      listenWhen: (previous, current) =>
          current is UnoZeroGameState || current is UnoZeroLoadFailed,
      listener: (context, state) {
        if (state is UnoZeroLoadFailed && mounted) {
          Navigator.pop(context);
          return;
        }
        if (state is! UnoZeroGameState) return;

        if (state.currentPlayerIndex != _currentPageIndex &&
            _pageController.hasClients) {
          _pageController.animateToPage(
            state.currentPlayerIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }

        if (state.gameEnded &&
            !state.hasShownGameEndModal &&
            !_isGameEndModalShown) {
          _showGameEndModal(state);
        }
      },
      builder: (context, state) {
        if (state is! UnoZeroGameState) {
          return Scaffold(
            backgroundColor: theme.bgColor,
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        final gameState = state;
        final board = gameState.scoreboard;
        final leaders = board.hasAnyScore ? board.leaderIndexes : const <int>[];

        return PopScope(
          canPop: false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
              leftButtonText: S.of(context).menu,
              onLeftButtonPressed: () => Navigator.pushNamed(context, '/home'),
              isRules: true,
              rightButtonText: S.of(context).rules,
              onRightButtonPressed: () =>
                  Navigator.pushNamed(context, '/unoZeroRules'),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: GeneralConst.paddingHorizontal,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${board.currentRoundNumber.toString().padLeft(2, '0')} / ${board.totalRounds.toString().padLeft(2, '0')}',
                          style: theme.display2.copyWith(
                            color: theme.secondaryTextColor,
                          ),
                        ),
                        Text(
                          '${S.of(context).unoZeroRoundLeft} ${board.roundsLeft.toString().padLeft(2, '0')}',
                          style: theme.display2.copyWith(
                            color: theme.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (leaders.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: GeneralConst.paddingHorizontal,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          leaders.length > 1
                              ? '${S.of(context).unoZeroTied}: ${leaders.map((index) => gameState.players[index].name).join(', ')}'
                                    .toLowerCase()
                              : '${S.of(context).unoZeroLeading}: ${gameState.players[leaders.first].name}'
                                    .toLowerCase(),
                          style: theme.display2.copyWith(color: theme.redColor),
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: gameState.players.length,
                            onPageChanged: (index) {
                              _currentPageIndex = index;
                              context.read<UnoZeroBloc>().add(
                                ChangeUnoZeroCurrentPlayer(index),
                              );
                            },
                            itemBuilder: (context, index) {
                              final player = gameState.players[index];
                              final place = board
                                  .standings()
                                  .firstWhere(
                                    (standing) => standing.playerIndex == index,
                                  )
                                  .place
                                  .toString()
                                  .padLeft(2, '0');
                              final buffer = _buffers[index] ?? '';
                              final stored = board.currentRoundScore(index);
                              final roundText = buffer.isNotEmpty
                                  ? buffer
                                  : stored?.toString() ?? '—';
                              final history = board.previousScores(index);

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      GeneralConst.paddingHorizontal / 2,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PlayerCard(player: player),
                                    const SizedBox(height: 8),
                                    Text(
                                      '#$place  ${S.of(context).unoZeroThisRound} $roundText',
                                      style: theme.display2.copyWith(
                                        color: buffer.isNotEmpty
                                            ? theme.redColor
                                            : theme.secondaryTextColor,
                                      ),
                                    ),
                                    if (history.isNotEmpty)
                                      Text(
                                        '${S.of(context).unoZeroHistory} ${history.join(' ')}',
                                        style: theme.display2.copyWith(
                                          color: theme.secondaryTextColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: gameState.players.asMap().entries.map((
                            entry,
                          ) {
                            final index = entry.key;
                            final letter = entry.value.name.isEmpty
                                ? '?'
                                : entry.value.name.substring(0, 1);
                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                _pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: PlayerIndicator(
                                  letter: letter,
                                  isActive:
                                      index == gameState.currentPlayerIndex,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: GeneralConst.paddingHorizontal,
                    ),
                    child: UnoZeroKeyboard(
                      onDigit: _pushDigit,
                      onBackspace: _backspace,
                      onConfirm: _confirmScore,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            bottomNavigationBar: BottomGameBar(
              dialogWidget: const InfoUnoZeroDialog(),
              isArrow: true,
              rightButtonText: S.of(context).options,
              onLeftArrowTap: () =>
                  context.read<UnoZeroBloc>().add(UndoUnoZeroScore()),
              onRightArrowTap: () =>
                  context.read<UnoZeroBloc>().add(RedoUnoZeroScore()),
              onRightBtnTap: () => _showGameEndModal(gameState),
              isLeftArrowActive: board.canUndo,
              isRightArrowActive: board.canRedo,
            ),
          ),
        );
      },
    );
  }
}
