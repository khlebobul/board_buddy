import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/thousand/bloc/thousand_bloc.dart';
import 'package:board_buddy/features/games/thousand/widgets/players_score_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// TODO edit
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
  final Map<int, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.state.players.length; i++) {
      _controllers[i] = TextEditingController(
        text: widget.state.enteredScores[i]?.toString() ?? '',
      );
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final bidderPlayer = widget.state.players[widget.state.bidWinnerIndex];

    return Padding(
      padding: const EdgeInsets.all(GeneralConst.paddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'подсчет очков',
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
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ставка:',
                    style: theme.display6.copyWith(
                      color: theme.secondaryTextColor,
                    ),
                  ),
                  Text(
                    '${widget.state.winningBid}',
                    style: theme.display6.copyWith(
                      color: theme.textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          PlayersScoreWidget(
            players: widget.state.players,
            playerData: widget.state.playerData,
            bidWinnerIndex: widget.state.bidWinnerIndex,
          ),
          const SizedBox(height: 16),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...widget.state.players.asMap().entries.map((entry) {
                    final index = entry.key;
                    final player = entry.value;
                    final isBidder = index == widget.state.bidWinnerIndex;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  player.name.toLowerCase(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: theme.display2.copyWith(
                                    color: theme.textColor,
                                  ),
                                ),
                              ),
                              if (isBidder)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: theme.redColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'Ставка: ${widget.state.winningBid}',
                                    style: theme.display4.copyWith(
                                      color: theme.textColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _controllers[index],
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: theme.display3.copyWith(
                              color: theme.textColor,
                            ),
                            decoration: InputDecoration(
                              hintText: 'введите очки',
                              hintStyle: theme.display3.copyWith(
                                color: theme.secondaryTextColor,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: theme.secondaryTextColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: theme.secondaryTextColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: theme.redColor,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                final score = int.tryParse(value);
                                if (score != null) {
                                  context.read<ThousandBloc>().add(
                                        EnterPlayerScore(index, score),
                                      );
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 16),

                  if (widget.state.enteredScores.length ==
                          widget.state.players.length &&
                      widget.state.enteredScores.values
                          .every((score) => score != null))
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'набрал ли ${bidderPlayer.name.toLowerCase()} свою ставку (${widget.state.winningBid} очков)?',
                            textAlign: TextAlign.center,
                            style: theme.display2.copyWith(
                              color: theme.textColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: widget.state.bidderSuccess != true
                                      ? () {
                                          context.read<ThousandBloc>().add(
                                                ConfirmBidderSuccess(true),
                                              );
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: theme.fgColor,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                  ),
                                  child: Text(
                                    'да',
                                    style: theme.display2.copyWith(
                                      color: theme.textColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: widget.state.bidderSuccess != false
                                      ? () {
                                          context.read<ThousandBloc>().add(
                                                ConfirmBidderSuccess(false),
                                              );
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: theme.redColor,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                  ),
                                  child: Text(
                                    'нет',
                                    style: theme.display2.copyWith(
                                      color: theme.textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
