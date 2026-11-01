import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_serve/core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static bool _isArabic(BuildContext context) =>
      Localizations.localeOf(context).languageCode == 'ar';

  // العناوين: Plus Jakarta Sans (إنجليزي) / Cairo (عربي)
  static TextStyle _heading(
      BuildContext context,
      double size,
      FontWeight weight,
      ) {
    final color = AppColors.of(context).textPrimary;
    return _isArabic(context)
        ? GoogleFonts.cairo(fontSize: size, fontWeight: weight, color: color)
        : GoogleFonts.plusJakartaSans(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  // النصوص والأزرار: Poppins (إنجليزي) / Cairo (عربي)
  static TextStyle _body(
      BuildContext context,
      double size,
      FontWeight weight,
      ) {
    final color = AppColors.of(context).textPrimary;
    return _isArabic(context)
        ? GoogleFonts.cairo(fontSize: size, fontWeight: weight, color: color)
        : GoogleFonts.poppins(fontSize: size, fontWeight: weight, color: color);
  }

  // العناوين
  static TextStyle headlineLarge(BuildContext c) =>
      _heading(c, 28, FontWeight.w700);
  static TextStyle headline(BuildContext c) =>
      _heading(c, 22, FontWeight.w700);
  static TextStyle title(BuildContext c) => _heading(c, 18, FontWeight.w600);
  static TextStyle subtitle(BuildContext c) =>
      _heading(c, 16, FontWeight.w600);

  // النصوص
  static TextStyle body(BuildContext c) => _body(c, 14, FontWeight.w400);
  static TextStyle bodyMedium(BuildContext c) =>
      _body(c, 14, FontWeight.w500);
  static TextStyle bodySmall(BuildContext c) => _body(c, 12, FontWeight.w400);
  static TextStyle caption(BuildContext c) => _body(c, 10, FontWeight.w400);

  // الأزرار والعناوين الصغيرة
  static TextStyle button(BuildContext c) => _body(c, 16, FontWeight.w600);
  static TextStyle label(BuildContext c) => _body(c, 12, FontWeight.w500);

  // اسم القسم في الشريط السفلي: Work Sans (إنجليزي) / Cairo (عربي)
  static TextStyle navLabel(BuildContext context) {
    final color = AppColors.of(context).navUnselected;
    return _isArabic(context)
        ? GoogleFonts.cairo(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color,
    )
        : GoogleFonts.workSans(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }
}