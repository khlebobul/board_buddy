import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';

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
      content: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children:
            SeaSaltPaperCollectionPoints.points.asMap().entries.map((entry) {
          final count = entry.key + 1;
          final points = entry.value;
          return _CollectionButton(
            count: count,
            points: points,
            theme: theme,
            onTap: () {
              Gaimon.soft();
              Navigator.pop(context);
              onPointsSelected(points);
            },
          );
        }).toList(),
      ),
    );
  }
}

class _CollectionButton extends StatefulWidget {
  final int count;
  final int points;
  final UIThemes theme;
  final VoidCallback onTap;

  const _CollectionButton({
    required this.count,
    required this.points,
    required this.theme,
    required this.onTap,
  });

  @override
  State<_CollectionButton> createState() => _CollectionButtonState();
}

class _CollectionButtonState extends State<_CollectionButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: _isPressed
              ? widget.theme.borderColor.withValues(alpha: 0.3)
              : widget.theme.bgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.theme.borderColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${widget.count}',
              style: widget.theme.display6.copyWith(
                color: widget.theme.textColor,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: widget.theme.redColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: widget.theme.redColor.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Text(
                '+${widget.points}',
                style: widget.theme.display6.copyWith(
                  color: widget.theme.redColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
