import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/widgets/app_widgets/bottom_game_widget.dart';
import 'package:board_buddy/widgets/app_widgets/custom_app_bar.dart';
import 'package:board_buddy/widgets/info_dialog_widgets/info_uno_dialog_widget.dart';
import 'package:flutter/material.dart';

class UnoFlipGame extends StatelessWidget {
  const UnoFlipGame({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).unoFlip,
        onRightButtonPressed: () {},
      ),
      bottomNavigationBar: BottomGameBar(
        dialogWidget: const InfoUnoDialog(),
        leftButtonText: S.of(context).rules,
        isArrow: true,
        rightButtonText: S.of(context).finish,
      ),
    );
  }
}
