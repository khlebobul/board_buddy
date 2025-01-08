import '../../../utils/library.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required PreferencesService preferencesService,
    required ThemeService themeService,
  }) : super(const SettingsState(
            selectedLanguage: 'en', isDarkModeEnabled: false)) {
    on<LoadSettings>(_onLoadSettings);
    on<ChangeLanguage>(_onChangeLanguage);
    on<ChangeTheme>(_onChangeTheme);
  }

  Future<void> _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final languageCode = await PreferencesService.getLanguageCode();
    final isDarkMode = await PreferencesService.getDarkModeEnabled();

    emit(state.copyWith(
      selectedLanguage: languageCode,
      isDarkModeEnabled: isDarkMode,
      isLoading: false,
    ));
  }

  Future<void> _onChangeLanguage(
    ChangeLanguage event,
    Emitter<SettingsState> emit,
  ) async {
    await PreferencesService.setLanguageCode(event.languageCode);
    emit(state.copyWith(selectedLanguage: event.languageCode));
  }

  Future<void> _onChangeTheme(
    ChangeTheme event,
    Emitter<SettingsState> emit,
  ) async {
    await PreferencesService.setDarkModeEnabled(event.isDarkMode);
    ThemeService.updateTheme(event.isDarkMode);
    emit(state.copyWith(isDarkModeEnabled: event.isDarkMode));
  }
}
