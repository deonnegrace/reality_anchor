import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData light() {
    const textTheme = TextTheme(
      headlineMedium: TextStyle(
        fontSize: 28,
        height: 1.15,
        fontWeight: FontWeight.w600,
        color: AppColors.ink,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppColors.ink,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: AppColors.ink,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        height: 1.45,
        fontWeight: FontWeight.w500,
        color: AppColors.inkSoft,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: AppColors.ink,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'PlusJakartaSans',
      scaffoldBackgroundColor: AppColors.mist,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.teal,
        primary: AppColors.teal,
        surface: AppColors.mist,
      ),
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.mist,
        foregroundColor: AppColors.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
      ),
    );
  }
}
