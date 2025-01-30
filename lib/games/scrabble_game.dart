import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/widgets/app_widgets/bottom_game_widget.dart';
import 'package:board_buddy/widgets/app_widgets/custom_app_bar.dart';
import 'package:board_buddy/widgets/game_widgets/scrabble_word_input_widget.dart';
import 'package:board_buddy/widgets/info_dialog_widgets/info_scrabble_dialog_widget.dart';
import 'package:flutter/material.dart';

class ScrabbleGame extends StatelessWidget {
  const ScrabbleGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).scrabble,
        onRightButtonPressed: () {},
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: ScrabbleWordInputWidget(),
      ),
      bottomNavigationBar: BottomGameBar(
        dialogWidget: const InfoscrabbleDialog(),
        leftButtonText: S.of(context).rules,
        isArrow: true,
        rightButtonText: S.of(context).finish,
      ),
    );
  }
}
