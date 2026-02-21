import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaimon/gaimon.dart';
import 'package:use_scramble/use_scramble.dart';

class ColorMajorityDialog extends StatelessWidget {
  final Function(int) onPointsSelected;

  const ColorMajorityDialog({
    super.key,
    required this.onPointsSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final TextEditingController controller = TextEditingController();
    final FocusNode focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });

    void addPoints() {
      final value = int.tryParse(controller.text.trim()) ?? 0;
      if (value > 0) {
        Gaimon.soft();
        Navigator.pop(context);
        onPointsSelected(value);
      }
    }

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
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              S.of(context).colorMajority,
              style: theme.display2.copyWith(color: theme.textColor),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              S.of(context).enterNumberOfCards,
              style: theme.display6.copyWith(color: theme.secondaryTextColor),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              decoration: BoxDecoration(
                color: theme.bgColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: theme.secondaryTextColor),
              ),
              child: TextField(
                focusNode: focusNode,
                controller: controller,
                style: TextStyle(color: theme.textColor),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '0',
                  hintStyle: TextStyle(color: theme.secondaryTextColor),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                ),
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => addPoints(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.pop(context);
                },
                child: TextScramble(
                    text: S.of(context).cancel,
                    builder: (context, scrambledText) {
                      return Text(
                        scrambledText,
                        style: theme.display2
                            .copyWith(color: theme.secondaryTextColor),
                      );
                    }),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: addPoints,
                child: TextScramble(
                    text: S.of(context).add,
                    builder: (context, scrambledText) {
                      return Text(
                        scrambledText,
                        style: theme.display2.copyWith(color: theme.redColor),
                      );
                    }),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
