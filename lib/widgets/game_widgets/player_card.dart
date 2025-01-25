import 'package:board_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  final String playerName;
  final int score;
  const PlayerCard({
    required this.playerName,
    required this.score,
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
              playerName,
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
              score.toString().toLowerCase(),
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

// final List<Map<String, dynamic>> players = [
//       {'name': 'Player 1', 'score': 0},
//       {'name': 'Player 2', 'score': 10},
//       {'name': 'Player 3', 'score': 20},
//       {'name': 'Player 4', 'score': 30},
//     ];

// SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: players
//                 .map((player) => Padding(
//                       padding: const EdgeInsets.only(right: 8.0),
//                       child: PlayerCard(
//                         playerName: player['name'],
//                         score: player['score'],
//                       ),
//                     ))
//                 .toList(),
//           ),
//         ),
