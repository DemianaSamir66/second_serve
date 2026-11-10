import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';
import 'package:second_serve/core/widgets/dashed_border.dart';

class PhotoUploadBox extends StatelessWidget {
  final String? image;
  final String label;
  final String? hint;
  final IconData icon;
  final double iconSize;
  final Color? iconColor;
  final IconData? badgeIcon;
  final Color? backgroundColor;
  final Color? borderColor;
  final double radius;
  final VoidCallback? onTap;
  final double aspectRatio;

  const PhotoUploadBox({
    super.key,
    this.image,
    this.label = 'Tap to upload or take a photo',
    this.hint,
    this.icon = Icons.add_a_photo_outlined,
    this.iconSize = 28,
    this.iconColor,
    this.badgeIcon,
    this.backgroundColor,
    this.borderColor,
    this.radius = 24,
    this.onTap,
    this.aspectRatio = 348 / 200,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final hasImage = image != null && image!.isNotEmpty;

    final content = Material(
      color: backgroundColor ?? colors.surfaceAlt,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
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
            PositionedDirectional(
              end: 12,
              bottom: 12,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: colors.surface,
                child: Icon(
                  Icons.edit_outlined,
                  size: 18,
                  color: colors.primary,
                ),
              ),
            ),
          ],
        )
            : Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: iconSize,
                    color: iconColor ?? colors.textPrimary,
                  ),
                  SizedBox(height: hint == null ? 12 : 6),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: hint == null
                        ? AppTextStyles.bodySmall(context).copyWith(
                      color: colors.textMuted,
                    )
                        : AppTextStyles.bodySmall(context).copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (hint != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      hint!,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.caption(context).copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (badgeIcon != null)
              PositionedDirectional(
                end: 10,
                bottom: 10,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: colors.surface,
                  child: Icon(
                    badgeIcon,
                    size: 14,
                    color: colors.textPrimary,
                  ),
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
        color: borderColor ?? colors.textMuted.withValues(alpha: 0.6),
        radius: radius,
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