import '../../utils/library.dart';

class GameResultsBottomSheet extends StatelessWidget {
  const GameResultsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    // TODO add players model
    final players = [
      {'name': 'player 1', 'score': 100},
      {'name': 'player 2', 'score': 20},
    ];

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.bgColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).results,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: TextScramble(
                    text: S.of(context).close,
                    style: theme.display2.copyWith(color: theme.redColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...players.map((player) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        player['name'].toString(),
                        style: theme.display2,
                      ),
                      Text(
                        player['score'].toString(),
                        style: theme.display2,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
