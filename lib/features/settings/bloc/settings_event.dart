part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class LoadSettings extends SettingsEvent {}

class ChangeLanguage extends SettingsEvent {
  final String languageCode;

  ChangeLanguage(this.languageCode);
}

class ChangeTheme extends SettingsEvent {
  final bool isDarkMode;

  ChangeTheme(this.isDarkMode);
}

class ToggleKeepScreenOn extends SettingsEvent {
  final bool keepScreenOn;

  ToggleKeepScreenOn(this.keepScreenOn);
}
