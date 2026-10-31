import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_serve/core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static bool _isArabic(BuildContext context) {
    return Localizations.localeOf(context).languageCode == 'ar';
  }

  static TextStyle _heading(
      BuildContext context,
      double size,
      FontWeight weight,
      ) {
    final color = AppColors.of(context).textPrimary;

    return _isArabic(context)
        ? GoogleFonts.cairo(
      fontSize: size,
      fontWeight: weight,
      color: color,
    )
        : GoogleFonts.plusJakartaSans(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  static TextStyle _body(
      BuildContext context,
      double size,
      FontWeight weight,
      ) {
    final color = AppColors.of(context).textPrimary;

    return _isArabic(context)
        ? GoogleFonts.cairo(
      fontSize: size,
      fontWeight: weight,
      color: color,
    )
        : GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  // Headings
  static TextStyle headlineLarge(BuildContext c) =>
      _heading(c, 28, FontWeight.w700);

  static TextStyle headline(BuildContext c) =>
      _heading(c, 22, FontWeight.w700);

  static TextStyle title(BuildContext c) =>
      _heading(c, 18, FontWeight.w600);

  static TextStyle subtitle(BuildContext c) =>
      _heading(c, 16, FontWeight.w600);

  // Body
  static TextStyle body(BuildContext c) =>
      _body(c, 14, FontWeight.w400);

  static TextStyle bodyMedium(BuildContext c) =>
      _body(c, 14, FontWeight.w500);

  static TextStyle bodySmall(BuildContext c) =>
      _body(c, 12, FontWeight.w400);

  static TextStyle caption(BuildContext c) =>
      _body(c, 10, FontWeight.w400);

  // Buttons and small labels
  static TextStyle button(BuildContext c) =>
      _body(c, 16, FontWeight.w600);

  static TextStyle label(BuildContext c) =>
      _body(c, 12, FontWeight.w500);
}