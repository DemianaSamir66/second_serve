// This file is reserved for future implementation.
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_serve/core/constants/app_assets.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback? onGoogle;
  final VoidCallback? onFacebook;
  final VoidCallback? onEmail;
  final VoidCallback? onThemeTap;
  final VoidCallback? onLanguageTap;

  const WelcomeScreen({
    super.key,
    this.onGoogle,
    this.onFacebook,
    this.onEmail,
    this.onThemeTap,
    this.onLanguageTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final size = MediaQuery.sizeOf(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            children: [
              // أيقونات الثيم واللغة
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: onThemeTap,
                      icon: Icon(
                        isDark ? Icons.dark_mode_outlined : Icons.wb_sunny_outlined,
                        size: 20,
                        color: colors.textPrimary,
                      ),
                    ),
                    IconButton(
                      onPressed: onLanguageTap,
                      icon: Icon(
                        Icons.language,
                        size: 20,
                        color: colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Text(
                "Let's get started\nsaving food!",
                textAlign: TextAlign.center,
                style: AppTextStyles.headline(context).copyWith(
                  fontSize: 26,
                  height: 1.25,
                  color: colors.primary,
                ),
              ),

              // اللوجو في النص
              Expanded(
                child: Center(
                  child: Image.asset(
                    AppAssets.logo,
                    width: size.width * 0.6,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.volunteer_activism,
                        size: 96,
                        color: colors.primary,
                      );
                    },
                  ),
                ),
              ),

              // الأزرار
              _AuthButton(
                label: 'Continue with Google',
                leading: SvgPicture.asset(
                  'assets/icons/google.svg',
                  width: 20,
                  height: 20,
                ),
                background: colors.surface,
                foreground: AppColors.googleButtonText,
                borderColor: AppColors.googleButtonBorder,
                onTap: onGoogle,
              ),
              const SizedBox(height: 12),
              _AuthButton(
                label: 'Continue with Facebook',
                leading: const Icon(Icons.facebook, size: 20, color: Colors.white),
                background: AppColors.facebookBlue,
                foreground: Colors.white,
                onTap: onFacebook,
              ),
              const SizedBox(height: 12),
              _AuthButton(
                label: 'Continue with email',
                leading: Icon(
                  Icons.mail_outline,
                  size: 20,
                  color: colors.onPrimary,
                ),
                background: colors.primary,
                foreground: colors.onPrimary,
                onTap: onEmail,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  final String label;
  final Widget leading;
  final Color background;
  final Color foreground;
  final Color? borderColor;
  final VoidCallback? onTap;

  const _AuthButton({
    required this.label,
    required this.leading,
    required this.background,
    required this.foreground,
    this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Material(
        color: background,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leading,
              const SizedBox(width: 10),
              Text(
                label,
                style: AppTextStyles.bodyMedium(context).copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}