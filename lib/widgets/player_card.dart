import 'package:board_buddy/utils/library.dart';

class PlayerCard extends StatelessWidget {
  final String playerName;
  final int score;
  const PlayerCard({required this.playerName, required this.score, super.key});

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
