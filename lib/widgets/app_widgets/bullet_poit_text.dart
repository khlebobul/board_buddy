import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/app_constants.dart';
import 'package:flutter/material.dart';

class BulletPointText extends StatelessWidget {
  final String contentText;
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
