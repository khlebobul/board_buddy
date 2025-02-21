import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:flutter/material.dart';

/// widget that displays text with a bullet point.
class BulletPointText extends StatelessWidget {
  /// The main content text to display.
  final String contentText;

  /// The symbol used as a bullet point.
  final String pointSimbol;

  const BulletPointText({
    super.key,
    required this.contentText,
    this.pointSimbol = BulletPointsConst.pointOne,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pointSimbol,
          style: theme.display2,
        ),
        Expanded(
          child: Text(
            contentText,
            style: theme.display2,
          ),
        ),
      ],
    );
  }
}
