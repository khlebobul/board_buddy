import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/animated_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:use_scramble/use_scramble.dart';

/// Widget that displays a list of contributors with links to their GitHub profiles.
class ContributorsWidget extends StatelessWidget {
  /// List of contributor usernames.
  final List<String> contributors;

  const ContributorsWidget({
    super.key,
    required this.contributors,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Wrap(
      spacing: 8.0,
      children: [
        for (int i = 0; i < contributors.length; i++) ...[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              final url = 'https://github.com/${contributors[i]}';
              final uri = Uri.parse(url);
              if (uri.toString().isNotEmpty &&
                  uri.hasScheme &&
                  (uri.scheme == 'http' || uri.scheme == 'https')) {
                await launchUrl(uri);
              } else {
                AnimatedSnackBar.show(
                  context,
                  message: '${S.of(context).couldNotLaunch} $url',
                );
              }
            },
            child: TextScramble(
              text: '${GeneralConst.alias}${contributors[i]}',
              builder: (context, scrambledText) {
                return Text(
                  scrambledText,
                  style: theme.display2,
                );
              },
            ),
          ),
          if (i < contributors.length - 1)
            Text(
              GeneralConst.slash,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
        ],
      ],
    );
  }
}
