import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_serve/core/constants/app_icons.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class _PillButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final Color background;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback? onPressed;

  const _PillButton({
    required this.label,
    required this.icon,
    required this.background,
    required this.textColor,
    required this.onPressed,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          foregroundColor: textColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9999),
            side: borderColor == null
                ? BorderSide.none
                : BorderSide(color: borderColor!, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.button(context).copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialLoginButtons extends StatelessWidget {
  final String googleLabel;
  final String facebookLabel;
  final String emailLabel;
  final VoidCallback? onGoogle;
  final VoidCallback? onFacebook;
  final VoidCallback? onEmail;

  const SocialLoginButtons({
    super.key,
    required this.googleLabel,
    required this.facebookLabel,
    required this.emailLabel,
    this.onGoogle,
    this.onFacebook,
    this.onEmail,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PillButton(
          label: googleLabel,
          icon: SvgPicture.asset(AppSvgs.google, width: 24, height: 24),
          background: Colors.white,
          textColor: AppColors.googleButtonText,
          borderColor: AppColors.googleButtonBorder,
          onPressed: onGoogle,
        ),
        const SizedBox(height: 12),
        _PillButton(
          label: facebookLabel,
          icon: SvgPicture.asset(
            AppSvgs.facebook,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          background: AppColors.facebookBlue,
          textColor: Colors.white,
          onPressed: onFacebook,
        ),
        const SizedBox(height: 12),
        _PillButton(
          label: emailLabel,
          icon: const Icon(AppIcons.email, size: 24, color: Colors.white),
          background: colors.primary,
          textColor: Colors.white,
          onPressed: onEmail,
        ),
      ],
    );
  }
}