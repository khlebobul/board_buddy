import 'package:board_buddy/models/player_model.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  final Player player;
  const PlayerCard({
    required this.player,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              player.name.toLowerCase(),
              style: theme.display1.copyWith(
                color: theme.textColor,
              ),
            ),
          ),
          Divider(
            color: theme.borderColor,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0),
            child: Text(
              player.score.toString(),
              style: theme.display5.copyWith(
                color: theme.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
