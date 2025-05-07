part of 'settings_bloc.dart';

@immutable
class SettingsState {
  final String selectedLanguage;
  final bool isDarkModeEnabled;
  final bool keepScreenOn;
  final bool isLoading;

  const SettingsState({
    required this.selectedLanguage,
    required this.isDarkModeEnabled,
    this.keepScreenOn = false,
    this.isLoading = false,
  });

  SettingsState copyWith({
    String? selectedLanguage,
    bool? isDarkModeEnabled,
    bool? keepScreenOn,
    bool? isLoading,
  }) {
    return SettingsState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
      keepScreenOn: keepScreenOn ?? this.keepScreenOn,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
