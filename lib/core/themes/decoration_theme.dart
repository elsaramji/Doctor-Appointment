import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';

class DecorationTheme {
  // private variable
  static final BorderRadius _inputDecorationCircularBorder =
      BorderRadius.circular(40.r);
  static final BorderRadius _buttonCircularBorder = BorderRadius.circular(
    8.0.r,
  );
  static final BorderSide _inputDecorationFocusedBorder = BorderSide(
    color: AppColors.primaryDefault,
    width: 1.0.sp,
  );
  static final BorderSide _inputDecorationErrorBorder = BorderSide(
    color: AppColors.error500,
    width: 1.0.sp,
  );
  // light color scheme
  static ColorScheme lightcolorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: AppColors.primaryDefault,
    primary: AppColors.primaryDefault,
    onPrimary: AppColors.white,
    secondary: AppColors.secondaryDefault,
    onSecondary: AppColors.white,
    surface: AppColors.white,
    onSurface: AppColors.secondaryDefault,
    shadow: AppColors.black.withAlpha(41),
  );
  // buttons decoration theme light.
  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDefault,
          foregroundColor: AppColors.white,
          elevation: 9,
          shape: RoundedRectangleBorder(borderRadius: _buttonCircularBorder),
        ),
      );
  // outlined button theme
  static OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryDefault,
          elevation: 9,
          side: BorderSide(color: AppColors.primaryDefault, width: 1.0.sp),
          shape: RoundedRectangleBorder(borderRadius: _buttonCircularBorder),
        ),
      );
  // text button theme
  static TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryDefault,
      elevation: 9,
    ),
  );

  // input decoration theme
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: _inputDecorationCircularBorder,
      borderSide: _inputDecorationFocusedBorder,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: _inputDecorationCircularBorder,
      borderSide: _inputDecorationFocusedBorder.copyWith(width: 0.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: _inputDecorationCircularBorder,
      borderSide: _inputDecorationFocusedBorder.copyWith(width: 0.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: _inputDecorationCircularBorder,
      borderSide: _inputDecorationFocusedBorder,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: _inputDecorationCircularBorder,
      borderSide: _inputDecorationErrorBorder,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: _inputDecorationCircularBorder,
      borderSide: _inputDecorationErrorBorder,
    ),
  );

  // checkbox theme
  static CheckboxThemeData checkboxThemeData = CheckboxThemeData(
    checkColor: WidgetStateProperty.all(AppColors.white),
    fillColor: WidgetStateProperty.all(AppColors.primaryDefault),
    splashRadius: 4.0.r,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0.r),
      side: BorderSide(color: AppColors.primaryDefault, width: 2.0.sp),
    ),
  );
  // AppBarTheme
  static AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: AppColors.white,
    elevation: 0.0,
    scrolledUnderElevation: 0.0,
    iconTheme: IconThemeData(color: AppColors.secondaryDefault, size: 24.0.sp),
  );
}
