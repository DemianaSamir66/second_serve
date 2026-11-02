// This file is reserved for future implementation.

import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback? onAction;
  final IconData icon;

  const SuccessDialog({
    super.key,
    required this.title,
    required this.message,
    this.actionLabel = 'Back to Home',
    this.onAction,
    this.icon = Icons.check_rounded,
  });

  /// الاستخدام:
  /// SuccessDialog.show(
  ///   context,
  ///   title: 'Donation Received Successfully!',
  ///   message: 'Thank you for helping reduce food waste and supporting those in need.',
  ///   onAction: () => context.go('/home'),
  /// );
  static Future<void> show(
      BuildContext context, {
        required String title,
        required String message,
        String actionLabel = 'Back to Home',
        VoidCallback? onAction,
        IconData icon = Icons.check_rounded,
      }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (_) => SuccessDialog(
        title: title,
        message: message,
        actionLabel: actionLabel,
        onAction: onAction,
        icon: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Dialog(
      backgroundColor: colors.surface,
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.primary,
              ),
              child: Icon(icon, size: 24, color: colors.onPrimary),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.headline(context).copyWith(
                fontSize: 20,
                color: colors.primaryDark,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall(context).copyWith(
                color: colors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.of(context).pop();
                onAction?.call();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  actionLabel,
                  style: AppTextStyles.label(context).copyWith(
                    color: colors.accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}