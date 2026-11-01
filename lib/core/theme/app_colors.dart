
import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.background,
    required this.surfaceAlt,
    required this.inputFill,
    required this.surface,
    required this.primary,
    required this.primaryLight,
    required this.primaryDark,
    required this.primaryTint,
    required this.accent,
    required this.accentDark,
    required this.error,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.onPrimary,
    required this.border,
    required this.blue,
    required this.link,
    required this.navBackground,
    required this.navBorder,
    required this.navSelected,
    required this.navUnselected,
  });

  final Color background;
  final Color surfaceAlt;
  final Color inputFill;
  final Color surface;
  final Color primary;
  final Color primaryLight;
  final Color primaryDark;
  final Color primaryTint;
  final Color accent;
  final Color accentDark;
  final Color error;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color onPrimary;
  final Color border;
  final Color blue;
  final Color link;
  final Color navBackground;
  final Color navBorder;
  final Color navSelected;
  final Color navUnselected;

  // لون ثابت في الـ Light والـ Dark
  static const Color facebookBlue = Color(0xFF1877F2);

  static const AppColors light = AppColors(
    background: Color(0xFFF8EFE8),
    surfaceAlt: Color(0xFFFBFAF2),
    inputFill: Color(0xFFECEBE6),
    surface: Color(0xFFFFFFFF),
    primary: Color(0xFF24592C),
    primaryLight: Color(0xFF9DD090),
    primaryDark: Color(0xFF154242),
    primaryTint: Color(0xFFF1F8E9),
    accent: Color(0xFFFF9F54),
    accentDark: Color(0xFF713800),
    error: Color(0xFFD44638),
    textPrimary: Color(0xFF23262F),
    textSecondary: Color(0xFF7D7979),
    textMuted: Color(0xFF464E57),
    onPrimary: Color(0xFFFFFFFF),
    border: Color(0xFFE3E3E3),
    blue: Color(0xFF2566AF),
    link: Color(0xFF2A86FF),
    navBackground: Color(0xFFFFF8F4),
    navBorder: Color(0xFFEAE1DA),
    navSelected: Color(0xFF7EB377),
    navUnselected: Color(0xFF42493E),
  );

  static const AppColors dark = AppColors(
    background: Color(0xFF121512),
    surfaceAlt: Color(0xFF1A1F1A),
    inputFill: Color(0xFF262C26),
    surface: Color(0xFF1C211C),
    primary: Color(0xFF3E7A36),
    primaryLight: Color(0xFF2F4A2B),
    primaryDark: Color(0xFF154242),
    primaryTint: Color(0xFF1E2E1B),
    accent: Color(0xFFFF9F54),
    accentDark: Color(0xFFFFD2A8),
    error: Color(0xFFEF6B5E),
    textPrimary: Color(0xFFEDEDE8),
    textSecondary: Color(0xFFA8A5A0),
    textMuted: Color(0xFF9AA1A9),
    onPrimary: Color(0xFFFFFFFF),
    border: Color(0xFF3A403A),
    blue: Color(0xFF4F8FD6),
    link: Color(0xFF5AA0FF),
    navBackground: Color(0xFF171B17),
    navBorder: Color(0xFF2E342E),
    navSelected: Color(0xFF7EB377),
    navUnselected: Color(0xFFB5BAB0),
  );

  /// الاستخدام: AppColors.of(context).primary
  static AppColors of(BuildContext context) =>
      Theme.of(context).extension<AppColors>()!;

  @override
  AppColors copyWith({
    Color? background,
    Color? surfaceAlt,
    Color? inputFill,
    Color? surface,
    Color? primary,
    Color? primaryLight,
    Color? primaryDark,
    Color? primaryTint,
    Color? accent,
    Color? accentDark,
    Color? error,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? onPrimary,
    Color? border,
    Color? blue,
    Color? link,
    Color? navBackground,
    Color? navBorder,
    Color? navSelected,
    Color? navUnselected,
  }) {
    return AppColors(
      background: background ?? this.background,
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      inputFill: inputFill ?? this.inputFill,
      surface: surface ?? this.surface,
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryDark: primaryDark ?? this.primaryDark,
      primaryTint: primaryTint ?? this.primaryTint,
      accent: accent ?? this.accent,
      accentDark: accentDark ?? this.accentDark,
      error: error ?? this.error,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      onPrimary: onPrimary ?? this.onPrimary,
      border: border ?? this.border,
      blue: blue ?? this.blue,
      link: link ?? this.link,
      navBackground: navBackground ?? this.navBackground,
      navBorder: navBorder ?? this.navBorder,
      navSelected: navSelected ?? this.navSelected,
      navUnselected: navUnselected ?? this.navUnselected,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      surfaceAlt: Color.lerp(surfaceAlt, other.surfaceAlt, t)!,
      inputFill: Color.lerp(inputFill, other.inputFill, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      primaryTint: Color.lerp(primaryTint, other.primaryTint, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentDark: Color.lerp(accentDark, other.accentDark, t)!,
      error: Color.lerp(error, other.error, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      border: Color.lerp(border, other.border, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      link: Color.lerp(link, other.link, t)!,
      navBackground: Color.lerp(navBackground, other.navBackground, t)!,
      navBorder: Color.lerp(navBorder, other.navBorder, t)!,
      navSelected: Color.lerp(navSelected, other.navSelected, t)!,
      navUnselected: Color.lerp(navUnselected, other.navUnselected, t)!,
    );
  }
}