import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const _defaultFontFamily = 'CourierNew';

  static TextTheme get textTheme {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        fontFamily: _defaultFontFamily,
        color: AppColors.text,
      ),
      displayMedium: TextStyle(
        fontSize: 30,
        fontFamily: _defaultFontFamily,
        color: AppColors.primary,
      ),
      displaySmall: TextStyle(
        fontSize: 30,
        fontFamily: _defaultFontFamily,
        color: AppColors.text,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontFamily: _defaultFontFamily,
        color: AppColors.text,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontFamily: _defaultFontFamily,
        color: AppColors.primary,
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontFamily: _defaultFontFamily,
        color: AppColors.text,
      ),
    );
  }
}
