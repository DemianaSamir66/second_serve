import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';

class SquareBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const SquareBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Material(
      color: colors.surface,
      elevation: 0,
      shadowColor: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap ?? () => Navigator.maybePop(context),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.chevron_left,
            size: 22,
            color: colors.textPrimary,
          ),
        ),
      ),
    );
  }
}