part of 'settings_bloc.dart';

@immutable
class SettingsState {
  final String selectedLanguage;
  final bool isDarkModeEnabled;
  final bool isLoading;

  const SettingsState({
    required this.selectedLanguage,
    required this.isDarkModeEnabled,
    this.isLoading = false,
  });

  SettingsState copyWith({
    String? selectedLanguage,
    bool? isDarkModeEnabled,
    bool? isLoading,
  }) {
    return SettingsState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
