import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/thousand/bloc/thousand_bloc.dart';
import 'package:board_buddy/features/games/thousand/models/thousand_models.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_indicator.dart';
import 'package:board_buddy/shared/widgets/game_widgets/points_keyboard.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaimon/gaimon.dart';

class ScoringPhaseWidget extends StatefulWidget {
  final ScoringPhaseState state;

  const ScoringPhaseWidget({
    super.key,
    required this.state,
  });

  @override
  State<ScoringPhaseWidget> createState() => _ScoringPhaseWidgetState();
}

class _ScoringPhaseWidgetState extends State<ScoringPhaseWidget> {
  late final PageController _pageController;
  int _currentPageIndex = 0;
  bool _hasShownBidderModal = false;

  @override
  void initState() {
    super.initState();

    int initialPage = 0;
    for (int i = 0; i < widget.state.players.length; i++) {
      if (widget.state.enteredScores[i] == null) {
        initialPage = i;
        break;
      }
    }

    _currentPageIndex = initialPage;
    _pageController = PageController(
      initialPage: initialPage,
      viewportFraction: 0.85,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ScoringPhaseWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.state.enteredScores.length == widget.state.players.length &&
        widget.state.enteredScores.values.every((score) => score != null) &&
        widget.state.bidderSuccess == null &&
        !_hasShownBidderModal) {
      _hasShownBidderModal = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final bidderPlayer = widget.state.players[widget.state.bidWinnerIndex];
        _showBidderSuccessModal(context, bidderPlayer, widget.state.winningBid);
      });
    }

    if (oldWidget.state.enteredScores.length !=
        widget.state.enteredScores.length) {
      _hasShownBidderModal = false;
    }
  }

  void _showBidderSuccessModal(
      BuildContext context, Player bidderPlayer, int winningBid) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            _hasShownBidderModal = false;
          }
        },
        child: ModalWindowWidget(
          mainText: S.of(context).didPlayerReachBid(
                bidderPlayer.name.toLowerCase(),
                winningBid,
              ),
          button1Text: S.of(context).yes,
          button2Text: S.of(context).no,
          button1Action: () {
            Navigator.of(dialogContext).pop();
            Gaimon.soft();
            _hasShownBidderModal = false;
            context.read<ThousandBloc>().add(
                  ConfirmBidderSuccess(true),
                );
          },
          button2Action: () {
            Navigator.of(dialogContext).pop();
            Gaimon.soft();
            _hasShownBidderModal = false;
            context.read<ThousandBloc>().add(
                  ConfirmBidderSuccess(false),
                );
          },
        ),
      ),
    ).then((_) {
      _hasShownBidderModal = false;
    });
  }

  int? _findNextUnscoredPlayer(int startIndex) {
    for (int i = startIndex; i < widget.state.players.length; i++) {
      if (widget.state.enteredScores[i] == null) {
        return i;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final bidderPlayer = widget.state.players[widget.state.bidWinnerIndex];
    final isCurrentPlayerScored =
        widget.state.enteredScores[_currentPageIndex] != null;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(GeneralConst.paddingHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).setScoringTitle,
                    style: theme.display6.copyWith(
                      color: theme.secondaryTextColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bidderPlayer.name.toLowerCase(),
                      style: theme.display6.copyWith(color: theme.textColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(GeneralConst.paddingHorizontal),
              child: Text(
                '${widget.state.winningBid}',
                style: theme.display2.copyWith(
                  color: theme.textColor,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: constraints.maxHeight * 0.35,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.state.players.length,
                      pageSnapping: true,
                      padEnds: true,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final player = widget.state.players[index];
                        final isScored =
                            widget.state.enteredScores[index] != null;
                        final score = isScored
                            ? widget.state.enteredScores[index]!
                            : widget.state.currentScoreCalculation[index] ?? 0;

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: GeneralConst.paddingHorizontal / 2,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isScored
                                    ? theme.borderColor
                                    : theme.redColor,
                                width: isScored ? 1 : 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: theme.fgColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    player.name.toLowerCase(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: theme.display2.copyWith(
                                      color: theme.secondaryTextColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Divider(
                                  color: theme.borderColor,
                                  height: 1,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    score.toString(),
                                    style: theme.display5.copyWith(
                                      color: isScored
                                          ? theme.textColor
                                          : theme.redColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.state.players.asMap().entries.map((entry) {
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
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const Spacer(),
            if (!isCurrentPlayerScored)
              Padding(
                padding: const EdgeInsets.all(GeneralConst.paddingHorizontal),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Gaimon.soft();
                            context.read<ThousandBloc>().add(
                                  ClearPlayerScore(_currentPageIndex),
                                );
                          },
                          child: Text(
                            S.of(context).clear,
                            style: theme.display2.copyWith(
                              color: theme.secondaryTextColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Gaimon.soft();
                            context.read<ThousandBloc>().add(
                                  ConfirmPlayerScore(_currentPageIndex),
                                );
                            final nextIndex =
                                _findNextUnscoredPlayer(_currentPageIndex + 1);
                            if (nextIndex != null) {
                              _pageController.animateToPage(
                                nextIndex,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Text(
                            S.of(context).confirm,
                            style: theme.display2.copyWith(
                              color: theme.redColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomKeyboard(
                      buttons:
                          _buildCardButtons(context, _currentPageIndex, theme),
                    ),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  S.of(context).pointsConfirmed,
                  style: theme.display2.copyWith(
                    color: theme.secondaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
          ],
        );
      },
    );
  }

  List<List<KeyboardButton>> _buildCardButtons(
    BuildContext context,
    int playerIndex,
    UIThemes theme,
  ) {
    final bloc = context.read<ThousandBloc>();

    // Map CardRank to display labels using constants
    final cardRankToLabel = {
      CardRank.ace: ThousandCardsText.ace,
      CardRank.ten: ThousandCardsText.ten,
      CardRank.king: ThousandCardsText.king,
      CardRank.queen: ThousandCardsText.queen,
      CardRank.jack: ThousandCardsText.jack,
      CardRank.nine: ThousandCardsText.nine,
    };

    // Card ranks in display order: A, 10, K, Q, J, 9
    final cardRanks = [
      CardRank.ace,
      CardRank.ten,
      CardRank.king,
      CardRank.queen,
      CardRank.jack,
      CardRank.nine,
    ];

    final List<List<KeyboardButton>> rows = [];
    List<KeyboardButton> currentRow = [];

    for (var cardRank in cardRanks) {
      final label = cardRankToLabel[cardRank]!;
      final points = cardRank.points;

      currentRow.add(
        KeyboardButton(
          buttonText: label,
          onPressed: () {
            bloc.add(AddCardToPlayerScore(playerIndex, points));
          },
        ),
      );

      if (currentRow.length >= 3) {
        rows.add(currentRow);
        currentRow = [];
      }
    }

    if (currentRow.isNotEmpty) {
      while (currentRow.length < 3) {
        currentRow.add(
          KeyboardButton(
            buttonText: '',
            onPressed: null,
          ),
        );
      }
      rows.add(currentRow);
    }

    return rows;
  }
}
