import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';
import 'package:second_serve/core/widgets/dashed_border.dart';

class AchievementBadgeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isUnlocked;
  final Color? color; // لون الدايرة (مثلاً accent للـ Streak)
  final bool showCard; // true = كارت (Impact)، false = بدون كارت (Rescue Journey)
  final double size;
  final VoidCallback? onTap;

  const AchievementBadgeCard({
    super.key,
    required this.title,
    required this.icon,
    this.isUnlocked = true,
    this.color,
    this.showCard = true,
    this.size = 56,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    final Widget circle = isUnlocked
        ? Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? colors.primary,
      ),
      child: Icon(icon, size: size * 0.45, color: colors.onPrimary),
    )
        : DashedBorder(
      circle: true,
      color: colors.textSecondary.withValues(alpha: 0.6),
      strokeWidth: 1.2,
      dash: 4,
      gap: 3,
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(icon,
            size: size * 0.45,
            color: colors.textSecondary.withValues(alpha: 0.7)),
      ),
    );

    final label = Text(
      title,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.label(context).copyWith(
        color: isUnlocked ? colors.textPrimary : colors.textSecondary,
      ),
    );

    final body = Column(
      mainAxisSize: MainAxisSize.min,
      children: [circle, const SizedBox(height: 10), label],
    );

    if (!showCard) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: body,
      );
    }

    return Material(
      color: colors.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: colors.navBorder),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: body,
        ),
      ),
    );
  }
}