import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/widgets/app_widgets/bottom_game_widget.dart';
import 'package:board_buddy/widgets/app_widgets/custom_app_bar.dart';
import 'package:board_buddy/widgets/info_dialog_widgets/info_uno_flip_dialog_widget.dart';
import 'package:flutter/material.dart';

/// uno flip game screen
class UnoFlipGame extends StatelessWidget {
  const UnoFlipGame({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        isRules: true,
        rightButtonText: S.of(context).rules,
        onRightButtonPressed: () => Navigator.pushNamed(context, '/unoFlipRules'),
      ),
      bottomNavigationBar: BottomGameBar(
        dialogWidget: const InfoUnoFlipDialog(),
        leftButtonText: S.of(context).rules,
        isArrow: true,
        rightButtonText: S.of(context).finish,
      ),
    );
  }
}
