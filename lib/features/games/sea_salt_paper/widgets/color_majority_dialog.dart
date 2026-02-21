import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';

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

    return AlertDialog(
      backgroundColor: theme.fgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.borderColor),
      ),
      title: Text(
        S.of(context).colorMajority,
        style: theme.display2.copyWith(color: theme.textColor),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).enterNumberOfCards,
            style: theme.display3.copyWith(color: theme.secondaryTextColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: theme.display3.copyWith(color: theme.textColor),
            decoration: InputDecoration(
              hintText: '0',
              hintStyle:
                  theme.display3.copyWith(color: theme.secondaryTextColor),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: theme.borderColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: theme.textColor),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            S.of(context).cancel,
            style: theme.display3.copyWith(color: theme.secondaryTextColor),
          ),
        ),
        TextButton(
          onPressed: () {
            final value = int.tryParse(controller.text) ?? 0;
            Navigator.pop(context);
            if (value > 0) {
              onPointsSelected(value);
            }
          },
          child: Text(
            S.of(context).add,
            style: theme.display3.copyWith(color: theme.redColor),
          ),
        ),
      ],
    );
  }
}
