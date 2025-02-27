import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/add_player_dialog.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class UnoStartScreen extends StatefulWidget {
  const UnoStartScreen({super.key});

  @override
  UnoStartScreenState createState() => UnoStartScreenState();
}

class UnoStartScreenState extends State<UnoStartScreen> {
  final List<Player> players = [];
  String selectedMode = '';
  int scoreLimit = 500;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedMode = S.current.highestScoreWins;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).uno,
        onRightButtonPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
                horizontal: GeneralConst.paddingHorizontal) +
            const EdgeInsets.only(top: GeneralConst.paddingVertical),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).mode,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            _buildModeOption(context, S.of(context).highestScoreWins),
            _buildModeOption(context, S.of(context).lowestScoreWins),
            const SizedBox(height: 12),
            Text(
              S.of(context).score,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            SizedBox(
              height: 100,
              child: WheelChooser.integer(
                onValueChanged: (value) => setState(() => scoreLimit = value),
                maxValue: 1000,
                minValue: 100,
                step: 50,
                initValue: scoreLimit,
                horizontal: true,
                unSelectTextStyle:
                    theme.display6.copyWith(color: theme.secondaryTextColor),
                selectTextStyle: theme.display6,
                itemSize: 70,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              S.of(context).players,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: players.asMap().entries.map((entry) {
                int index = entry.key + 1;
                Player player = entry.value;
                String formattedIndex = index.toString().padLeft(2, '0');
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$formattedIndex - ${player.name}',
                      style: theme.display2.copyWith(color: theme.textColor),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: theme.secondaryTextColor),
                      onPressed: () {
                        setState(() {
                          players.removeAt(entry.key);
                        });
                      },
                    ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            if (players.length < GameMaxPlayers.uno)
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddPlayerDialog(
                      onPlayerAdded: (player) {
                        setState(() {
                          players.add(player);
                        });
                      },
                    ),
                  );
                },
                child: TextScramble(
                  text: S.of(context).add,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomGameBar(
          leftButtonText: S.of(context).rules,
          rightButtonText: S.of(context).play,
          isRightBtnRed: true,
          onRightBtnTap: () {
            players.length < GameMinPlayers.uno
                ? ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          '${S.of(context).theNumberOfPlayersShouldBe} ${RulesConst.unoPlayers}'),
                    ),
                  )
                : () {};
          }),
    );
  }

  Widget _buildModeOption(BuildContext context, String modeName) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMode = modeName;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor:
                selectedMode == modeName ? theme.redColor : Colors.transparent,
            radius: 3,
          ),
          const SizedBox(width: 8),
          TextScramble(
            text: modeName,
            style: theme.display2,
          ),
        ],
      ),
    );
  }
}
