import '../library.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        surface: AppColors.background,
      ),
      textTheme: AppTextStyles.textTheme,
      fontFamily: 'CourierNew',
    );
  }
}
