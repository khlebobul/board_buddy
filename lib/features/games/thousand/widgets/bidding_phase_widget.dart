import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/features/games/thousand/bloc/thousand_bloc.dart';
import 'package:board_buddy/features/games/thousand/models/thousand_models.dart';
import 'package:board_buddy/features/games/thousand/widgets/players_score_widget.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/game_widgets/points_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaimon/gaimon.dart';
import 'package:not_static_icons/not_static_icons.dart';

class BiddingPhaseWidget extends StatelessWidget {
  final BiddingPhaseState state;

  const BiddingPhaseWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final currentPlayer = state.players[state.currentBidderIndex];

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
                    S.of(context).biddingPhase,
                    style: theme.display6.copyWith(
                      color: theme.secondaryTextColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      currentPlayer.name.toLowerCase(),
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
                    S.of(context).currentBet,
                    style: theme.display6.copyWith(
                      color: theme.secondaryTextColor,
                    ),
                  ),
                  Text(
                    '${state.highestBid ?? 0}',
                    style: theme.display6.copyWith(
                      color: theme.textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Players score with bids
          PlayersScoreWidget(
            players: state.players,
            playerData: state.playerData,
            currentPlayerIndex: state.currentBidderIndex,
            passedPlayers: state.passedPlayers,
            showBids: true,
          ),
          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Gaimon.soft();
                    context.read<ThousandBloc>().add(PassBidding());
                  },
                  child: Text(
                    S.of(context).pass,
                    style: theme.display2.copyWith(
                      color: theme.redColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomKeyboard(
                buttons: _buildAllBidButtons(context, state, theme),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<List<KeyboardButton>> _buildAllBidButtons(
    BuildContext context,
    BiddingPhaseState state,
    UIThemes theme,
  ) {
    final bloc = context.read<ThousandBloc>();

    // Get card bids (not marriages)
    final cardBids =
        BidOption.allBidOptions.where((b) => !b.isMarriage).toList();

    // Get marriage bid value (use 80 as default)
    final marriageBid = BidOption.allBidOptions
        .where((b) => b.isMarriage)
        .firstWhere((b) => b.value == 80);

    // Define suit icons and colors (4 suits)
    final suitData = [
      {
        'icon': HeartIcon(
          color: theme.redColor,
          size: 30,
          strokeWidth: 1,
        ),
        'disabledIcon': HeartIcon(
          color: theme.secondaryTextColor,
          size: 30,
          strokeWidth: 1,
        ),
      },
      {
        'icon': DiamondIcon(
          color: theme.redColor,
          size: 30,
          strokeWidth: 1,
        ),
        'disabledIcon': DiamondIcon(
          color: theme.secondaryTextColor,
          size: 30,
          strokeWidth: 1,
        ),
      },
      {
        'icon': ClubIcon(
          color: theme.textColor,
          size: 30,
          strokeWidth: 1,
        ),
        'disabledIcon': ClubIcon(
          color: theme.secondaryTextColor,
          size: 30,
          strokeWidth: 1,
        ),
      },
      {
        'icon': SpadeIcon(
          color: theme.textColor,
          size: 30,
          strokeWidth: 1,
        ),
        'disabledIcon': SpadeIcon(
          color: theme.secondaryTextColor,
          size: 30,
          strokeWidth: 1,
        ),
      },
    ];

    final List<List<KeyboardButton>> rows = [];
    List<KeyboardButton> currentRow = [];

    // Add card bids (10, J, Q, K, A)
    for (var bidOption in cardBids) {
      final isEnabled =
          state.highestBid == null || bidOption.value > state.highestBid!;

      currentRow.add(
        KeyboardButton(
          buttonText: bidOption.label,
          onPressed: isEnabled
              ? () {
                  bloc.add(MakeBid(bidOption.value));
                }
              : null,
          textColor: isEnabled ? null : theme.secondaryTextColor,
        ),
      );

      // Create new row every 3 buttons
      if (currentRow.length >= 3) {
        rows.add(currentRow);
        currentRow = [];
      }
    }

    // Add marriage buttons (4 suits)
    for (var suit in suitData) {
      final isEnabled =
          state.highestBid == null || marriageBid.value > state.highestBid!;

      currentRow.add(
        KeyboardButton(
          icon: isEnabled
              ? suit['icon'] as Widget
              : suit['disabledIcon'] as Widget,
          onPressed: isEnabled
              ? () {
                  bloc.add(MakeBid(marriageBid.value));
                }
              : null,
          iconSize: 30.0,
        ),
      );

      // Create new row every 3 buttons
      if (currentRow.length >= 3) {
        rows.add(currentRow);
        currentRow = [];
      }
    }

    // Add remaining buttons to complete the last row
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
