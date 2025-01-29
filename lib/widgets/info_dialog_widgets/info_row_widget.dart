import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:board_buddy/theme/app_theme.dart';

class InfoRowWidget extends StatelessWidget {
  final String cardName;
  final String iconPath;
  final String title;
  final String points;
  final String description;

  const InfoRowWidget({
    super.key,
    this.cardName = '',
    this.iconPath = '',
    required this.title,
    required this.points,
    required this.description,
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
              : Text(cardName, style: theme.display2),
          if (iconPath.isEmpty && cardName.isEmpty) const SizedBox(width: 24),
          const SizedBox(width: 15),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: theme.display2,
                children: [
                  TextSpan(
                    text: '$title ($points)\n',
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
