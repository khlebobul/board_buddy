import 'package:board_buddy/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UIThemes {
  final Brightness brightness;

  UIThemes({this.brightness = Brightness.light});

  static final ButtonStyle _noSplash = ButtonStyle(
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    splashFactory: NoSplash.splashFactory,
  );

  static ThemeData _withoutTapEffects(ThemeData theme) {
    return theme.copyWith(
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      iconButtonTheme: IconButtonThemeData(style: _noSplash),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        splashColor: Colors.transparent,
      ),
      textButtonTheme: TextButtonThemeData(style: _noSplash),
      elevatedButtonTheme: ElevatedButtonThemeData(style: _noSplash),
      outlinedButtonTheme: OutlinedButtonThemeData(style: _noSplash),
      filledButtonTheme: FilledButtonThemeData(style: _noSplash),
      navigationBarTheme: NavigationBarThemeData(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      tabBarTheme: TabBarThemeData(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
      ),
      checkboxTheme: CheckboxThemeData(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        splashRadius: 0,
      ),
      radioTheme: RadioThemeData(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        splashRadius: 0,
      ),
      switchTheme: SwitchThemeData(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      sliderTheme: SliderThemeData(
        overlayColor: Colors.transparent,
        overlayShape: SliderComponentShape.noOverlay,
      ),
      menuButtonTheme: MenuButtonThemeData(style: _noSplash),
      segmentedButtonTheme: SegmentedButtonThemeData(style: _noSplash),
      toggleButtonsTheme: const ToggleButtonsThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      searchBarTheme: SearchBarThemeData(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
    );
  }

  // Light mode
  static ThemeData lightTheme() {
    return _withoutTapEffects(ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'RobotoMono',
      scaffoldBackgroundColor: LightModeColors.background,
      dividerColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        centerTitle: true,
        backgroundColor: LightModeColors.background,
        elevation: 0,
      ),
      colorScheme: const ColorScheme.light(
        primary: Colors.transparent,
        surface: LightModeColors.background,
      ),
    ));
  }

  // Dark mode
  static ThemeData darkTheme() {
    return _withoutTapEffects(ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'RobotoMono',
      scaffoldBackgroundColor: DarkModeColors.background,
      dividerColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        centerTitle: true,
        backgroundColor: DarkModeColors.background,
        elevation: 0,
      ),
      colorScheme: const ColorScheme.dark(
        primary: Colors.transparent,
        surface: DarkModeColors.background,
      ),
    ));
  }

  static UIThemes of(BuildContext context) {
    return UIThemes(brightness: Theme.of(context).brightness);
  }

  bool get isDarkTheme => brightness == Brightness.dark;

  // text styles
  // main menu
  TextStyle get display1 => TextStyle(
        fontSize: 30,
        fontFamily: 'RobotoMono',
        color: textColor,
      );

  // basic text
  TextStyle get display2 => TextStyle(
        fontSize: 20,
        fontFamily: 'RobotoMono',
        color: textColor,
      );

  // rules and games screen menu
  TextStyle get display3 => TextStyle(
        fontSize: 27,
        fontFamily: 'RobotoMono',
        color: textColor,
      );

  // timer
  TextStyle get display4 => TextStyle(
        fontSize: 25,
        fontFamily: 'RobotoMono',
        color: textColor,
      );

  // players card score
  TextStyle get display5 => TextStyle(
        fontSize: 50,
        fontFamily: 'RobotoMono',
        color: textColor,
      );

  // players indicator
  TextStyle get display6 => TextStyle(
        fontSize: 15,
        fontFamily: 'RobotoMono',
        color: textColor,
      );

  // scramble text
  TextStyle get display7 => TextStyle(
        fontSize: 10,
        fontFamily: 'RobotoMono',
        color: textColor,
      );

  // points keyboard
  TextStyle get display8 => TextStyle(
        fontSize: 25,
        fontFamily: 'RobotoMono',
        fontWeight: FontWeight.w300,
        color: textColor,
      );

  // for plus and minus buttons
  TextStyle get display9 => TextStyle(
        fontSize: 30,
        fontFamily: 'RobotoMono',
        fontWeight: FontWeight.w300,
        color: textColor,
      );

  TextStyle get display10 => TextStyle(
        fontSize: 8,
        fontFamily: 'RobotoMono',
        color: textColor,
      );

  // Colors
  // Background color
  Color get bgColor =>
      isDarkTheme ? DarkModeColors.background : LightModeColors.background;

  // Forground color
  Color get fgColor =>
      isDarkTheme ? DarkModeColors.foreground : LightModeColors.foreground;

  // Text color
  Color get textColor =>
      isDarkTheme ? DarkModeColors.text : LightModeColors.text;
  Color get secondaryTextColor => isDarkTheme
      ? DarkModeColors.secondaryText
      : LightModeColors.secondaryText;

  // Red color
  Color get redColor => isDarkTheme ? DarkModeColors.red : LightModeColors.red;

  // Border color
  Color get borderColor =>
      isDarkTheme ? DarkModeColors.border : LightModeColors.border;
}
