import 'library.dart';

// send email
Future<void> sendEmail(
    BuildContext context, String email, String subject) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      'subject': subject,
    },
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    await Clipboard.setData(ClipboardData(text: email));
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      // ignore: use_build_context_synchronously
      SnackBar(content: Text(S.of(context).emailCopied)),
    );
  }
}
