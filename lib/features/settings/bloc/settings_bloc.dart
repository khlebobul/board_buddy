import 'package:board_buddy/shared/services/preferences_service.dart';
import 'package:board_buddy/shared/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

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
    on<ToggleKeepScreenOn>(_onToggleKeepScreenOn);
  }

  Future<void> _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final languageCode = await PreferencesService.getLanguageCode();
    final isDarkMode = await PreferencesService.getDarkModeEnabled();
    final keepScreenOn = await PreferencesService.getKeepScreenOn();

    // Apply wakelock state on app startup
    await WakelockPlus.toggle(enable: keepScreenOn);

    emit(state.copyWith(
      selectedLanguage: languageCode,
      isDarkModeEnabled: isDarkMode,
      keepScreenOn: keepScreenOn,
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

  Future<void> _onToggleKeepScreenOn(
    ToggleKeepScreenOn event,
    Emitter<SettingsState> emit,
  ) async {
    await PreferencesService.setKeepScreenOn(event.keepScreenOn);
    await WakelockPlus.toggle(enable: event.keepScreenOn);
    emit(state.copyWith(keepScreenOn: event.keepScreenOn));
  }
}
