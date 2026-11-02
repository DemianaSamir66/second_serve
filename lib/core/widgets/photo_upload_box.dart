// This file is reserved for future implementation.

import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';
import 'package:second_serve/core/widgets/dashed_border.dart';

class PhotoUploadBox extends StatelessWidget {
  final String? image; // رابط (http) أو مسار asset
  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  final double aspectRatio;

  const PhotoUploadBox({
    super.key,
    this.image,
    this.label = 'Tap to upload or take a photo',
    this.icon = Icons.add_a_photo_outlined,
    this.onTap,
    this.aspectRatio = 348 / 200,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final hasImage = image != null && image!.isNotEmpty;

    final content = Material(
      color: colors.surfaceAlt,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: hasImage
            ? BorderSide(color: colors.navBorder)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        child: hasImage
            ? Stack(
          fit: StackFit.expand,
          children: [
            _buildImage(colors),
            Positioned(
              right: 12,
              bottom: 12,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: colors.surface,
                child: Icon(Icons.edit_outlined,
                    size: 18, color: colors.primary),
              ),
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: colors.textPrimary),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall(context).copyWith(
                color: colors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: hasImage
          ? content
          : DashedBorder(
        color: colors.textMuted.withValues(alpha: 0.6),
        radius: 24,
        child: content,
      ),
    );
  }

  Widget _buildImage(AppColors colors) {
    final placeholder = ColoredBox(color: colors.inputFill);
    if (image!.startsWith('http')) {
      return Image.network(
        image!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => placeholder,
      );
    }
    return Image.asset(
      image!,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => placeholder,
    );
  }
}