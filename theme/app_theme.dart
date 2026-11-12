import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => _buildTheme(
        brightness: Brightness.light,
        background: AppColors.lightBackground,
        surface: AppColors.lightSurface,
        text: AppColors.lightText,
        secondary: AppColors.lightSecondaryText,
        border: AppColors.lightBorder,
        accent: AppColors.accent,
      );

  static ThemeData get darkTheme => _buildTheme(
        brightness: Brightness.dark,
        background: AppColors.darkBackground,
        surface: AppColors.darkSurface,
        text: AppColors.darkText,
        secondary: AppColors.darkSecondaryText,
        border: AppColors.darkBorder,
        accent: AppColors.accentDark,
      );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color background,
    required Color surface,
    required Color text,
    required Color secondary,
    required Color border,
    required Color accent,
  }) {
    final scheme = ColorScheme.fromSeed(
      seedColor: accent,
      brightness: brightness,
      surface: surface,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme.copyWith(
        primary: accent,
        onSurface: text,
        surface: surface,
      ),
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: text,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: border),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: TextStyle(color: secondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: accent, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
