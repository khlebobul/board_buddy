import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/thousand/bloc/thousand_bloc.dart';
import 'package:board_buddy/features/games/thousand/widgets/players_score_widget.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  void _showBidderSuccessModal(BuildContext context, Player bidderPlayer) {
    ModalWindowWidget.show(
      context,
      mainText:
          'набрал ли ${bidderPlayer.name.toLowerCase()} свою ставку (${widget.state.winningBid} очков)?',
      button1Text: 'да',
      button2Text: 'нет',
      button1Action: () {
        Navigator.of(context).pop();
        Gaimon.soft();
        context.read<ThousandBloc>().add(
              ConfirmBidderSuccess(true),
            );
      },
      button2Action: () {
        Navigator.of(context).pop();
        Gaimon.soft();
        context.read<ThousandBloc>().add(
              ConfirmBidderSuccess(false),
            );
      },
    );
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
                    'подсчет очков:',
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
              Text(
                '${widget.state.winningBid}',
                style: theme.display2.copyWith(
                  color: theme.textColor,
                ),
                overflow: TextOverflow.ellipsis,
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
                            ],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: theme.bgColor,
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: theme.secondaryTextColor),
                            ),
                            child: TextField(
                              controller: _controllers[index],
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              cursorColor: theme.secondaryTextColor,
                              style: TextStyle(color: theme.textColor),
                              decoration: InputDecoration(
                                hintText: 'введите очки',
                                hintStyle:
                                    TextStyle(color: theme.secondaryTextColor),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 8.0,
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
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  if (widget.state.enteredScores.length ==
                          widget.state.players.length &&
                      widget.state.enteredScores.values
                          .every((score) => score != null) &&
                      widget.state.bidderSuccess == null)
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Gaimon.soft();
                          _showBidderSuccessModal(context, bidderPlayer);
                        },
                        child: Text(
                          'далее',
                          style: theme.display2.copyWith(
                            color: theme.redColor,
                          ),
                        ),
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
