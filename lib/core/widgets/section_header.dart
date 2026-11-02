// This file is reserved for future implementation.
import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? actionText; // مثال: View All
  final VoidCallback? onActionTap;

  /// true = عنوان صغير رمادي زي "Account" و "Charity Information"
  /// false = عنوان أخضر كبير زي "Your Impact Dashboard"
  final bool compact;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onActionTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    final titleStyle = compact
        ? AppTextStyles.bodyMedium(context).copyWith(
      color: colors.textSecondary,
    )
        : AppTextStyles.title(context).copyWith(color: colors.primary);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: titleStyle,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: AppTextStyles.body(context).copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (actionText != null)
          GestureDetector(
            onTap: onActionTap,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    actionText!,
                    style: AppTextStyles.label(context).copyWith(
                      color: colors.primary,
                    ),
                  ),
                  Icon(Icons.chevron_right, size: 16, color: colors.primary),
                ],
              ),
            ),
          ),
      ],
    );
  }
}