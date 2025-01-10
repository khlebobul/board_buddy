import '../../utils/library.dart';

class AddPlayersBottomSheet extends StatelessWidget {
  const AddPlayersBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    const int maxPlayers = 4;
    final List<Map<String, dynamic>> players = [
      {'name': 'player 1'},
      {'name': 'player 2'},
    ];

    void addPlayer() {
      if (players.length < maxPlayers) {
        players.add({'name': ''});
      }
    }

    return SafeArea(
      child: StatefulBuilder(
        builder: (context, setState) {
          return Container(
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
                      S.of(context).players,
                      style: theme.display2
                          .copyWith(color: theme.secondaryTextColor),
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
                ...players.asMap().entries.map((entry) {
                  final index = entry.key;
                  final player = entry.value;

                  return Row(
                    children: [
                      Text(
                        '${formatPlayerNumber(index + 1)} -',
                        style: theme.display2
                            .copyWith(color: theme.secondaryTextColor),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTextInput(
                          hintText:
                              player['name'].isEmpty ? 'name' : player['name'],
                          key: Key('player_input_$index'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO : edit player
                        },
                        child: SvgPicture.asset(
                          CustomIcons.edit,
                          width: 18,
                          // ignore: deprecated_member_use
                          color: theme.textColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          // TODO : remove player
                        },
                        child: SvgPicture.asset(
                          CustomIcons.remove,
                          width: 18,
                          // ignore: deprecated_member_use
                          color: theme.textColor,
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      addPlayer();
                    });
                  },
                  child: Text(
                    players.length >= maxPlayers ? '' : 'add player',
                    style: theme.display2.copyWith(
                      color: players.length >= maxPlayers
                          ? theme.secondaryTextColor
                          : theme.redColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
