import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/utils/useful_methods.dart';
import 'package:board_buddy/features/games/thousand/models/thousand_models.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:flutter/material.dart';

class PlayersScoreWidget extends StatelessWidget {
  final List<Player> players;
  final Map<int, ThousandPlayerData> playerData;
  final int? currentPlayerIndex;
  final int? bidWinnerIndex;
  final Set<int>? passedPlayers;
  final bool showBids;

  const PlayersScoreWidget({
    super.key,
    required this.players,
    required this.playerData,
    this.currentPlayerIndex,
    this.bidWinnerIndex,
    this.passedPlayers,
    this.showBids = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.borderColor, width: 1),
        borderRadius: BorderRadius.circular(20),
        color: theme.fgColor,
      ),
      child: Column(
        children: [
          for (int index = 0; index < players.length; index++) ...[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${formatPlayerNumber(index + 1)} - ${players[index].name.toLowerCase()}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: theme.display2.copyWith(
                            color: currentPlayerIndex == index
                                ? theme.redColor
                                : theme.secondaryTextColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Row(
                        children: [
                          Text(
                            playerData[index]!.roundScore.toString(),
                            style: theme.display2.copyWith(
                              color: theme.textColor,
                            ),
                          ),
                          if (showBids && passedPlayers != null) ...[
                            const SizedBox(width: 8),
                            Text(
                              passedPlayers!.contains(index)
                                  ? 'пас'
                                  : (playerData[index]!.currentBid != null
                                      ? '${playerData[index]!.currentBid}'
                                      : ''),
                              style: theme.display2.copyWith(
                                color: passedPlayers!.contains(index)
                                    ? theme.secondaryTextColor
                                    : theme.textColor,
                              ),
                            ),
                          ],
                          if (bidWinnerIndex == index &&
                              playerData[index]!.currentBid != null &&
                              !showBids) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: theme.redColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '${playerData[index]!.currentBid}',
                                style: theme.display4.copyWith(
                                  color: theme.textColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                          if (playerData[index]!.isOnBarrel) ...[
                            const SizedBox(width: 8),
                            // TODO edit icon
                            Icon(
                              Icons.warning_rounded,
                              size: 16,
                              color: theme.redColor,
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        playerData[index]!.totalScore.toString(),
                        style: theme.display2.copyWith(
                          color: playerData[index]!.isOnBarrel ||
                                  playerData[index]!.totalScore < 0
                              ? theme.redColor
                              : theme.textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (index < players.length - 1)
              Divider(
                color: theme.borderColor,
                height: 1,
              ),
          ],
        ],
      ),
    );
  }
}
