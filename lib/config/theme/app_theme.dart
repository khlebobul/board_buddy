import 'package:board_buddy/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UIThemes {
  final Brightness brightness;

  UIThemes({this.brightness = Brightness.light});

  // Light mode
  static ThemeData lightTheme() {
    return ThemeData(
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
    );
  }

  // Dark mode
  static ThemeData darkTheme() {
    return ThemeData(
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
    );
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
