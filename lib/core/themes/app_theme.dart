import 'package:flutter/material.dart';
import 'package:round_7_mobile_cure_team4/core/themes/decoration_theme.dart';

import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary500,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: DecorationTheme.appBarTheme,

      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headlineLarge,
        bodyLarge: AppTextStyles.bodyLarge,
        labelLarge: AppTextStyles.labelLarge,
      ),

      colorScheme: DecorationTheme.lightcolorScheme,
      elevatedButtonTheme: DecorationTheme.elevatedButtonThemeData,
      inputDecorationTheme: DecorationTheme.inputDecorationTheme,
      outlinedButtonTheme: DecorationTheme.outlinedButtonThemeData,
      textButtonTheme: DecorationTheme.textButtonThemeData,
    );
  }
}
