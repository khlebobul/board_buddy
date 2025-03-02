import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:use_scramble/use_scramble.dart';

class AddPlayerDialog extends StatelessWidget {
  final ValueChanged<Player> onPlayerAdded;

  const AddPlayerDialog({
    super.key,
    required this.onPlayerAdded,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final TextEditingController nameController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: theme.bgColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: theme.secondaryTextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: theme.bgColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: theme.secondaryTextColor),
              ),
              child: TextField(
                focusNode: focusNode,
                cursorColor: theme.secondaryTextColor,
                controller: nameController,
                style: TextStyle(color: theme.textColor),
                decoration: InputDecoration(
                  hintText: S.of(context).playerName,
                  hintStyle: TextStyle(color: theme.secondaryTextColor),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: TextScramble(
                  text: S.of(context).cancel,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final playerName = nameController.text.trim();
                  if (playerName.isNotEmpty) {
                    final newPlayer = Player(
                        name: playerName,
                        id: DateTime.now().millisecondsSinceEpoch);
                    onPlayerAdded(newPlayer);
                    Navigator.pop(context);
                  }
                },
                child: TextScramble(
                  text: S.of(context).add,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  static void show(BuildContext context,
      {required ValueChanged<Player> onPlayerAdded}) {
    HapticFeedback.selectionClick();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddPlayerDialog(
          onPlayerAdded: onPlayerAdded,
        );
      },
    );
  }
}
