import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:use_scramble/use_scramble.dart';
import 'package:share_plus/share_plus.dart';

/// widget that represents a clickable link button.
class LinkBtnWidget extends StatelessWidget {
  /// The text to display on the button.
  final String text;

  /// The URL to open when the button is clicked.
  final String url;

  /// Whether this button should share content instead of opening a URL
  final bool isShareButton;

  /// The text to share when isShareButton is true
  final String? shareText;

  const LinkBtnWidget({
    super.key,
    required this.text,
    required this.url,
    this.isShareButton = false,
    this.shareText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: () async {
        if (isShareButton) {
          await Share.share(shareText!);
        } else {
          final uri = Uri.parse(url);
          if (uri.toString().isNotEmpty &&
              uri.hasScheme &&
              (uri.scheme == 'http' || uri.scheme == 'https')) {
            await launchUrl(uri);
          } else {
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 5),
                  content: Text('${S.of(context).couldNotLaunch} $url')),
            );
          }
        }
      },
      child: TextScramble(
          text: text,
          builder: (context, scrambledText) {
            return Text(
              scrambledText,
              style: theme.display2,
            );
          }),
    );
  }
}
