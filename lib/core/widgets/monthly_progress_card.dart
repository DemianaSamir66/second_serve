// This file is reserved for future implementation.
import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class MonthlyProgressCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? tierLabel; // مثال: Emerald Tier
  final List<String> labels; // JAN, FEB, ...
  final List<double> values; // نفس عدد الـ labels
  final int? selectedIndex; // الشهر المميز
  final double chartHeight;

  const MonthlyProgressCard({
    super.key,
    required this.title,
    required this.labels,
    required this.values,
    this.subtitle,
    this.tierLabel,
    this.selectedIndex,
    this.chartHeight = 160,
  }) : assert(labels.length == values.length);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final maxValue =
    values.isEmpty ? 0.0 : values.reduce((a, b) => a > b ? a : b);

    return Material(
      color: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: colors.navBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppTextStyles.title(context)),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          subtitle!,
                          style: AppTextStyles.bodySmall(context).copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (tierLabel != null)
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: colors.primaryTint,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tierLabel!,
                      style: AppTextStyles.label(context).copyWith(
                        color: colors.primary,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: chartHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (int i = 0; i < labels.length; i++)
                    Expanded(
                      child: _Bar(
                        label: labels[i],
                        fraction: maxValue <= 0 ? 0 : values[i] / maxValue,
                        isSelected: i == selectedIndex,
                        chartHeight: chartHeight,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final String label;
  final double fraction;
  final bool isSelected;
  final double chartHeight;

  const _Bar({
    required this.label,
    required this.fraction,
    required this.isSelected,
    required this.chartHeight,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    const labelArea = 28.0;
    final barHeight =
    ((chartHeight - labelArea) * fraction).clamp(3.0, chartHeight);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 14,
          height: barHeight,
          decoration: BoxDecoration(
            color: isSelected
                ? colors.primary
                : colors.primaryLight.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.caption(context).copyWith(
            color: isSelected ? colors.primary : colors.textSecondary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}