import 'package:flutter/material.dart';
import 'package:warunk/core/constants/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.primaryLight,
        surface: AppColors.background,
        error: Colors.red,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.textDark,
      ),
      scaffoldBackgroundColor: AppColors.background,
      
      // Typography
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w800),
        displayMedium: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w800),
        displaySmall: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w800),
        headlineLarge: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w800),
        headlineMedium: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w800),
        headlineSmall: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w800),
        titleLarge: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w700),
        titleMedium: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w700),
        titleSmall: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: AppColors.textDark),
        bodyMedium: TextStyle(color: AppColors.textDark),
        bodySmall: TextStyle(color: AppColors.greyText),
        labelLarge: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w600),
        labelMedium: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w600),
        labelSmall: TextStyle(color: AppColors.greyText),
      ),

      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primary),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: AppColors.primary,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      // Text Field Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.greyBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.greyBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        prefixIconColor: AppColors.primary,
        suffixIconColor: AppColors.primary,
        hintStyle: const TextStyle(color: AppColors.greyText, fontSize: 14),
        labelStyle: const TextStyle(color: AppColors.textDark, fontSize: 14),
      ),
      
      // Bottom Navigation Bar Theme
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.white,
        indicatorColor: AppColors.primary.withValues(alpha: 0.15),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary);
          }
          return const IconThemeData(color: AppColors.textDark);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w700);
          }
          return const TextStyle(color: AppColors.textDark, fontSize: 12, fontWeight: FontWeight.w500);
        }),
      ),
    );
  }
}
