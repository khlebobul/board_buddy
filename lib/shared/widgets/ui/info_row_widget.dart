import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:board_buddy/config/theme/app_theme.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Center(
              child: iconPath.isNotEmpty
                  ? SvgPicture.asset(
                      iconPath,
                      width: 24,
                      height: 24,
                      colorFilter:
                          ColorFilter.mode(theme.textColor, BlendMode.srcIn),
                    )
                  : Text(
                      cardName,
                      style: isScrabble ? theme.display7 : theme.display2,
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: theme.display2,
                children: [
                  if (title.isNotEmpty && points.isNotEmpty)
                    TextSpan(
                      text: '$title\n($points ${S.of(context).points})\n',
                      style: theme.display2.copyWith(color: theme.textColor),
                    ),
                  if (title.isNotEmpty && points.isEmpty)
                    TextSpan(
                      text: '$title\n',
                      style: theme.display2.copyWith(color: theme.textColor),
                    ),
                  TextSpan(
                    text: description,
                    style: theme.display2.copyWith(
                      color: theme.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
