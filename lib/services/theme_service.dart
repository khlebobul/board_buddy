import '../utils/library.dart';

class ThemeService {
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

  static Future<void> initializeTheme() async {
    final isDarkMode = await PreferencesService.getDarkModeEnabled();
    themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.system;
  }

  static void updateTheme(bool isDarkMode) {
    themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static void useSystemTheme() {
    themeNotifier.value = ThemeMode.system;
  }
}
