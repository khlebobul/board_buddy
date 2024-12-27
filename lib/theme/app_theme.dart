import '../library.dart';

class UIThemes {
  final Brightness brightness;

  UIThemes({this.brightness = Brightness.light});

  // Light mode
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'CourierNew',
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
      fontFamily: 'CourierNew',
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

  // Text styles
  TextStyle get display1 => TextStyle(
        fontSize: 30,
        fontFamily: 'CourierNew',
        color: textColor,
        // fontWeight: FontWeight.w700,
        // height: 1.2,
      );

  TextStyle get display2 => TextStyle(
        fontSize: 20,
        fontFamily: 'CourierNew',
        color: textColor,
        // fontWeight: FontWeight.w700,
        // height: 1.2,
      );

  // Colors
  // Background color
  Color get bgColor =>
      isDarkTheme ? DarkModeColors.background : LightModeColors.background;

  // Text color
  Color get textColor =>
      isDarkTheme ? DarkModeColors.text : LightModeColors.text;
  Color get secondaryTextColor => isDarkTheme
      ? DarkModeColors.secondaryText
      : LightModeColors.secondaryText;

  // Red color
  Color get redColor => isDarkTheme ? DarkModeColors.red : LightModeColors.red;
}
