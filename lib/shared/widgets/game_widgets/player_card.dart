import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// widget that represents a card displaying player information.
class PlayerCard extends StatelessWidget {
  /// The player whose information is displayed on the card.
  final Player player;

  /// Optional list of badge widgets to display next to the player name.
  final List<Widget>? badges;

  const PlayerCard({
    required this.player,
    this.badges,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color: theme.borderColor, width: 1),
        borderRadius: BorderRadius.circular(20),
        color: theme.fgColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    player.name.toLowerCase(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: theme.display2.copyWith(
                      color: theme.secondaryTextColor,
                    ),
                  ),
                ),
                if (badges != null && badges!.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  ...badges!,
                ],
              ],
            ),
          ),
          const SizedBox(height: 5),
          Divider(
            color: theme.borderColor,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              player.score.toString(),
              style: theme.display5.copyWith(
                color: player.score < 0 ? theme.redColor : theme.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
