import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

enum ChipTone { accent, primary }

class ChoiceChipButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final IconData? icon;
  final ChipTone tone;

  const ChoiceChipButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.tone = ChipTone.accent,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final isAccent = tone == ChipTone.accent;

    final base = isAccent ? colors.accent : colors.primary;
    final bg = isSelected
        ? base
        : (isAccent
        ? colors.accent.withValues(alpha: 0.18)
        : AppColors.buttonSecondary);
    final fg = isSelected
        ? colors.onPrimary
        : (isAccent ? colors.accentDark : colors.primary);

    return Material(
      color: bg,
      clipBehavior: Clip.antiAlias,
      shape: const StadiumBorder(),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 16, color: fg),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: AppTextStyles.bodyMedium(context).copyWith(color: fg),
              ),
            ],
          ),
        ),
      ),
    );
  }
}