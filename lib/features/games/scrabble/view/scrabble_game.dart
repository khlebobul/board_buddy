import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/features/games/scrabble/widgets/scrabble_word_input_widget.dart';
import 'package:board_buddy/features/games/scrabble/widgets/info_scrabble_dialog_widget.dart';
import 'package:flutter/material.dart';

/// scrabble game screen
class ScrabbleGame extends StatelessWidget {
  const ScrabbleGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        isRules: true,
        rightButtonText: S.of(context).rules,
        onRightButtonPressed: () => Navigator.pushNamed(context, '/scrabbleRules'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: ScrabbleWordInputWidget(),
      ),
      bottomNavigationBar: BottomGameBar(
        dialogWidget: const InfoscrabbleDialog(),
        isArrow: true,
        rightButtonText: S.of(context).finish,
      ),
    );
  }
}
