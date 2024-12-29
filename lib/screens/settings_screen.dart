import '../library.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    final languageCode = await PreferencesService.getLanguageCode();
    setState(() {
      _selectedLanguage = languageCode;
    });
  }

  Future<void> _changeLanguage(String languageCode) async {
    await PreferencesService.setLanguageCode(languageCode);
    setState(() {
      _selectedLanguage = languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).settings,
        onRightButtonPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12) +
            const EdgeInsets.only(top: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).languages,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            _buildLanguageOption(context, 'english', 'en'),
            _buildLanguageOption(context, 'russian', 'ru'),
            const SizedBox(height: 12),
            Text(
              S.of(context).others,
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            _buildMailOption(
              context,
              S.of(context).reportABug,
              bug,
            ),
            _buildMailOption(
              context,
              S.of(context).shareFeedback,
              feedback,
            ),
            _buildMailOption(
              context,
              S.of(context).featureRequest,
              feature,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
      BuildContext context, String languageName, String languageCode) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: () => _changeLanguage(languageCode),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: _selectedLanguage == languageCode
                ? theme.redColor
                : Colors.transparent,
            radius: 3,
          ),
          const SizedBox(width: 8),
          TextScramble(
            text: languageName,
            style: theme.display2,
          ),
        ],
      ),
    );
  }

  Widget _buildMailOption(BuildContext context, String label, String subject) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: () => _sendEmail(context, subject),
      child: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: TextScramble(
          text: label,
          style: theme.display2,
        ),
      ),
    );
  }
}

Future<void> _sendEmail(BuildContext context, String subject) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'khlebobul@gmail.com',
    queryParameters: {
      'subject': subject,
    },
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    await Clipboard.setData(const ClipboardData(text: email));
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      // ignore: use_build_context_synchronously
      SnackBar(content: Text(S.of(context).emailCopied)),
    );
  }
}
