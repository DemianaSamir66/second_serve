import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_serve/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _build(AppColors.light, Brightness.light);

  static ThemeData get dark => _build(AppColors.dark, Brightness.dark);

  static OutlineInputBorder _border([BorderSide side = BorderSide.none]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: side,
      );

  static ThemeData _build(AppColors c, Brightness brightness) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: c.primary,
      onPrimary: c.onPrimary,
      secondary: c.accent,
      onSecondary: c.onPrimary,
      error: c.error,
      onError: Colors.white,
      surface: c.surface,
      onSurface: c.textPrimary,
    );

    final base = ThemeData(brightness: brightness).textTheme;
    final textTheme = GoogleFonts.poppinsTextTheme(base).apply(
      bodyColor: c.textPrimary,
      displayColor: c.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.background,
      textTheme: textTheme,
      extensions: [c],

      appBarTheme: AppBarTheme(
        backgroundColor: c.surface,
        foregroundColor: c.primary,
        elevation: 0,
        centerTitle: true,
      ),

      cardTheme: CardThemeData(
        color: c.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.inputFill,
        hintStyle: TextStyle(color: c.textSecondary),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(BorderSide(color: c.primary, width: 1.5)),
        errorBorder: _border(BorderSide(color: c.error)),
        focusedErrorBorder: _border(BorderSide(color: c.error, width: 1.5)),
        errorStyle: TextStyle(color: c.error, fontSize: 12),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: c.primary,
          foregroundColor: c.onPrimary,
          minimumSize: const Size.fromHeight(54),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      dividerTheme: DividerThemeData(
        color: c.border,
        thickness: 1,
      ),
    );
  }
}