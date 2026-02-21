import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/ui/modal_window_widget.dart';
import 'package:flutter/material.dart';

class MermaidVictoryDialog {
  static void show({
    required BuildContext context,
    required Player currentPlayer,
    required VoidCallback onConfirm,
  }) {
    ModalWindowWidget.show(
      context,
      mainText: '${currentPlayer.name} ${S.of(context).collectsFourMermaids}',
      button1Text: S.of(context).cancel,
      button2Text: S.of(context).confirm,
      button1Action: () => Navigator.pop(context),
      button2Action: () {
        Navigator.pop(context);
        onConfirm();
      },
    );
  }
}
