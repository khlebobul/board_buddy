import '../../utils/library.dart';

// TODO add state management
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'en';
  bool _isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
    _loadDarkModePreference();
  }

  // language
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

  // theme
  Future<void> _loadDarkModePreference() async {
    final isDarkMode = await PreferencesService.getDarkModeEnabled();
    setState(() {
      _isDarkModeEnabled = isDarkMode;
    });
  }

  Future<void> _changeTheme(bool isDarkMode) async {
    await PreferencesService.setDarkModeEnabled(isDarkMode);
    ThemeService.updateTheme(isDarkMode);
    setState(() {
      _isDarkModeEnabled = isDarkMode;
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
      body: SafeArea(
        child: Padding(
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
              _buildLanguageOption(context, S.of(context).english, 'en'),
              _buildLanguageOption(context, S.of(context).russian, 'ru'),
              const SizedBox(height: 12),
              Text(
                S.of(context).theme,
                style: theme.display2.copyWith(color: theme.secondaryTextColor),
              ),
              _buildThemeOption(context, S.of(context).light, false),
              _buildThemeOption(context, S.of(context).dark, true),
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
              const Spacer(),
              const AddFavouriteGame(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
      BuildContext context, String languageName, String languageCode) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: () {
        _changeLanguage(languageCode);
        LanguageService.changeLanguage(context, languageCode);
      },
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

  Widget _buildThemeOption(
      BuildContext context, String themeName, bool isDarkMode) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: () {
        _changeTheme(isDarkMode);
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: _isDarkModeEnabled == isDarkMode
                ? theme.redColor
                : Colors.transparent,
            radius: 3,
          ),
          const SizedBox(width: 8),
          TextScramble(
            text: themeName,
            style: theme.display2,
          ),
        ],
      ),
    );
  }

  Widget _buildMailOption(BuildContext context, String label, String subject) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: () => sendEmail(context, email, subject),
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
