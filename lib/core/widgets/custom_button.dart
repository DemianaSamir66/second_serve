import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

enum ButtonVariant { primary, secondary }

enum ButtonSize { large, compact }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final IconData? trailingIcon;
  final bool isLoading;
  final bool expand;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.large,
    this.trailingIcon,
    this.isLoading = false,
    this.expand = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final isPrimary = variant == ButtonVariant.primary;
    final isLarge = size == ButtonSize.large;

    final bg = isPrimary ? colors.primary : AppColors.buttonSecondary;
    final fg = isPrimary ? colors.onPrimary : colors.primary;
    final height = isLarge ? 54.0 : 48.0;
    final radius = isLarge ? 16.0 : 12.0;

    final textStyle = AppTextStyles.button(context).copyWith(
      color: fg,
      fontSize: isLarge ? 16 : 14,
    );

    return SizedBox(
      width: expand ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        onPressed: (onPressed == null || isLoading) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          disabledBackgroundColor: bg.withValues(alpha: 0.5),
          disabledForegroundColor: fg.withValues(alpha: 0.7),
          elevation: 0,
          minimumSize: Size(0, height),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: isLoading
            ? SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(strokeWidth: 2.5, color: fg),
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text, style: textStyle),
            if (trailingIcon != null) ...[
              const SizedBox(width: 8),
              Icon(trailingIcon, size: 18),
            ],
          ],
        ),
      ),
    );
  }
}