// This file is reserved for future implementation.
import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  final String time; // فوق على اليمين: Now / 10min
  final String? meta; // سطر صغير تحت: 12 hrs ago
  final bool isRead;
  final VoidCallback? onTap;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
    required this.time,
    this.meta,
    this.isRead = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Material(
      color: colors.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colors.navBorder),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.primaryTint,
                ),
                child: Icon(icon, size: 18, color: colors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.bodyMedium(context).copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (!isRead)
                          Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.only(right: 4, top: 1),
                            decoration: BoxDecoration(
                              color: colors.error,
                              shape: BoxShape.circle,
                            ),
                          ),
                        Text(
                          time,
                          style: AppTextStyles.caption(context).copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySmall(context).copyWith(
                        color: colors.textMuted,
                      ),
                    ),
                    if (meta != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        meta!,
                        style: AppTextStyles.caption(context).copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}