import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/models/player_model.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/custom_icons.dart';
import 'package:board_buddy/utils/useful_methods.dart';
import 'package:board_buddy/widgets/game_widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:use_scramble/use_scramble.dart';

class AddPlayersBottomSheet extends StatelessWidget {
  final int maxPlayers;
  const AddPlayersBottomSheet({
    this.maxPlayers = 4,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    final List<Player> players = [
      Player(name: 'player 1', id: 01),
      Player(name: 'player 2', id: 02),
    ];

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
                          hintText: player.name.isEmpty
                              ? 'name'
                              : player.name.toLowerCase(),
                          key: Key('player_input_$index'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO : edit player's name
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
                  onTap: () {},
                  child: Text(
                    players.length >= maxPlayers ? '' : S.of(context).addPlayer,
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
