import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:board_buddy/src/config/theme/app_theme.dart';

class InfoRowWidget extends StatelessWidget {
  final BuildContext context;
  final String cardName;
  final String iconPath;
  final String title;
  final String points;
  final String description;
  final bool isScrabble;

  const InfoRowWidget({
    super.key,
    required this.context,
    this.cardName = '',
    this.iconPath = '',
    this.title = '',
    this.points = '',
    required this.description,
    this.isScrabble = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconPath.isNotEmpty
              ? SvgPicture.asset(
                  iconPath,
                  width: 24,
                  height: 24,
                  // ignore: deprecated_member_use
                  color: theme.textColor,
                )
              : Text(
                  cardName,
                  style: isScrabble ? theme.display7 : theme.display2,
                  textAlign: TextAlign.center,
                ),
          if (iconPath.isEmpty && cardName.isEmpty) const SizedBox(width: 24),
          const SizedBox(width: 15),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: theme.display2,
                children: [
                  if (title.isNotEmpty && points.isNotEmpty)
                    TextSpan(
                      text: '$title\n($points ${S.of(context).points})\n',
                      style: theme.display2.copyWith(color: theme.redColor),
                    ),
                  if (title.isNotEmpty && points.isEmpty)
                    TextSpan(
                      text: '$title\n',
                      style: theme.display2.copyWith(color: theme.redColor),
                    ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
