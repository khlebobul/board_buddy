import '../library.dart';

class LinkBtnWidget extends StatelessWidget {
  final String text;
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
        if (uri.toString().isNotEmpty) {
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
