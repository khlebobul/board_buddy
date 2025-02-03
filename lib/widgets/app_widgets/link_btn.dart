import 'package:board_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:use_scramble/use_scramble.dart';

/// widget that represents a clickable link button.
class LinkBtnWidget extends StatelessWidget {
  /// The text to display on the button.
  final String text;

  /// The URL to open when the button is clicked.
  final String url;

  const LinkBtnWidget({
    super.key,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(url);
        if (uri.toString().isNotEmpty &&
            uri.hasScheme &&
            (uri.scheme == 'http' || uri.scheme == 'https')) {
          await launchUrl(uri);
        } else {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $url')),
          );
        }
      },
      child: TextScramble(text: text, style: theme.display2),
    );
  }
}
