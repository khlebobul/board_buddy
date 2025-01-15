import 'package:board_buddy/services/preferences_service.dart';
import 'package:flutter/material.dart';

class ThemeService {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  static Future<void> initializeTheme() async {
    final isDarkMode = await PreferencesService.getDarkModeEnabled();
    final hasStoredPreference =
        await PreferencesService.hasStoredThemePreference();

    if (hasStoredPreference) {
      themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    } else {
      themeNotifier.value = ThemeMode.system;
    }
  }

  static void updateTheme(bool isDarkMode) {
    themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static void useSystemTheme() {
    themeNotifier.value = ThemeMode.system;
  }
}
