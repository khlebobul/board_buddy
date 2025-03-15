import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/features/games/scrabble/widgets/scrabble_word_input_widget.dart';
import 'package:board_buddy/features/games/scrabble/widgets/info_scrabble_dialog_widget.dart';
import 'package:flutter/material.dart';

/// scrabble game screen
class ScrabbleGame extends StatelessWidget {
  final List<Player>? players;

  const ScrabbleGame({
    super.key,
    this.players,
  });

  @override
  Widget build(BuildContext context) {
    // Get players from arguments if not provided directly
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final gamePlayers = players ?? args?['players'] as List<Player>?;

    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        isRules: true,
        rightButtonText: S.of(context).rules,
        onRightButtonPressed: () =>
            Navigator.pushNamed(context, '/scrabbleRules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ScrabbleWordInputWidget(players: gamePlayers),
      ),
      bottomNavigationBar: BottomGameBar(
        dialogWidget: const InfoscrabbleDialog(),
        isArrow: true,
        rightButtonText: S.of(context).finish,
      ),
    );
  }
}
