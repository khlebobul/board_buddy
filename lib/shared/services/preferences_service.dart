import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _languageKey = 'language_code';
  static const String _darkModeKey = 'dark_mode';
  static const String _hasStoredThemeKey = 'has_stored_theme';
  static const String _keepScreenOnKey = 'keep_screen_on';

  static Future<String> getLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? 'en';
  }

  static Future<void> setLanguageCode(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  static Future<bool> getDarkModeEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_darkModeKey) ?? false;
  }

  static Future<void> setDarkModeEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, value);
    await prefs.setBool(_hasStoredThemeKey, true);
  }

  static Future<bool> hasStoredThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasStoredThemeKey) ?? false;
  }

  static Future<bool> getKeepScreenOn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keepScreenOnKey) ?? false;
  }

  static Future<void> setKeepScreenOn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keepScreenOnKey, value);
  }
}
