import 'package:flutter/material.dart';
import 'package:second_serve/core/constants/app_icons.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? colors.navSelected : AppColors.settingsIcon;

    return Material(
      color: colors.surface,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 56,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(icon, size: 16, color: iconColor),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.body(context).copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  AppIcons.chevronRight,
                  size: 20,
                  color: colors.navUnselected,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}