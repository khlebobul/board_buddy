import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:board_buddy/config/utils/useful_methods.dart';
import 'package:board_buddy/shared/widgets/ui/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:use_scramble/use_scramble.dart';

/// widget that represents a bottom sheet for adding players.
class AddPlayersBottomSheet extends StatefulWidget {
  /// Maximum number of players allowed.
  final int maxPlayers;

  /// Callback function to handle player addition.
  final ValueChanged<Player> onPlayerAdded;

  const AddPlayersBottomSheet({
    this.maxPlayers = 4,
    required this.onPlayerAdded,
    super.key,
  });

  @override
  AddPlayersBottomSheetState createState() => AddPlayersBottomSheetState();
}

class AddPlayersBottomSheetState extends State<AddPlayersBottomSheet> {
  List<Player> players = [
    Player(name: 'player 1', id: 01),
    Player(name: 'player 2', id: 02),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

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
                  S.of(context).players,
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
                      setState(() {
                        players.removeAt(index);
                      });
                    },
                    child: SvgPicture.asset(
                      CustomIcons.remove,
                      width: 18,
                      color: theme.textColor,
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                if (players.length < widget.maxPlayers) {
                  final newPlayer =
                      Player(name: 'new player', id: players.length + 1);
                  setState(() {
                    players.add(newPlayer);
                  });
                  widget.onPlayerAdded(newPlayer);
                }
              },
              child: Text(
                players.length >= widget.maxPlayers
                    ? ''
                    : S.of(context).addPlayer,
                style: theme.display2.copyWith(
                  color: players.length >= widget.maxPlayers
                      ? theme.secondaryTextColor
                      : theme.redColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
