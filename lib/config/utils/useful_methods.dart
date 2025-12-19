import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/animated_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

// send email
Future<void> sendEmail(
    BuildContext context, String email, String subject) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      'subject': '$subject - Board Buddy',
    },
  );

  final message = S.of(context).emailCopied;

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    await Clipboard.setData(ClipboardData(text: email));
    if (!context.mounted) return;
    AnimatedSnackBar.show(
      context,
      message: message,
    );
  }
}

// players number format
String formatPlayerNumber(int number) {
  return number < 10 ? '0$number' : '$number';
}
