import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';

class CollectionDialog extends StatelessWidget {
  final Function(int) onPointsSelected;

  const CollectionDialog({
    super.key,
    required this.onPointsSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return AlertDialog(
      backgroundColor: theme.fgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.borderColor),
      ),
      title: Text(
        S.of(context).collection,
        style: theme.display2.copyWith(color: theme.textColor),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children:
            SeaSaltPaperCollectionPoints.points.asMap().entries.map((entry) {
          final count = entry.key + 1;
          final points = entry.value;
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pop(context);
              onPointsSelected(points);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$count ${count == 1 ? S.of(context).card : S.of(context).cards}',
                    style: theme.display3.copyWith(color: theme.textColor),
                  ),
                  Text(
                    '+$points',
                    style: theme.display3.copyWith(color: theme.redColor),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
