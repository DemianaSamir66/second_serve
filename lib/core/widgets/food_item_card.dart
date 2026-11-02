// This file is reserved for future implementation.

import 'package:flutter/material.dart';
import 'package:second_serve/core/constants/app_icons.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';
import 'package:second_serve/core/widgets/custom_button.dart';

class FoodItemCard extends StatelessWidget {
  final String title;
  final String image; // رابط (http) أو مسار asset
  final double distanceKm;
  final int itemsLeft;
  final bool featured;
  final bool isSaved;
  final VoidCallback? onToggleSave;
  final VoidCallback? onBuy;
  final VoidCallback? onTap;

  const FoodItemCard({
    super.key,
    required this.title,
    required this.image,
    required this.distanceKm,
    required this.itemsLeft,
    this.featured = false,
    this.isSaved = false,
    this.onToggleSave,
    this.onBuy,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    final titleText = Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.headline(context).copyWith(fontSize: 20),
    );

    final distance = _MetaItem(
      icon: AppIcons.location,
      text: '${distanceKm.toStringAsFixed(1)}km away',
      color: colors.textMuted,
    );
    final items = _MetaItem(
      icon: AppIcons.itemsLeft,
      text: '$itemsLeft items left',
      color: colors.primaryDark,
      bold: true,
    );

    return Material(
      color: colors.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: colors.navBorder),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 348 / 256,
              child: _FoodImage(image: image),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: titleText),
                      if (featured)
                        GestureDetector(
                          onTap: onToggleSave,
                          child: Icon(
                            isSaved ? AppIcons.bookmarkFilled : AppIcons.bookmark,
                            color: isSaved ? colors.primary : colors.textSecondary,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (featured)
                    Row(
                      children: [
                        distance,
                        const SizedBox(width: 12),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: colors.border,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        items,
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        distance,
                        const SizedBox(height: 6),
                        items,
                      ],
                    ),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: 'Buy Now',
                    size: ButtonSize.compact,
                    variant:
                    featured ? ButtonVariant.primary : ButtonVariant.secondary,
                    trailingIcon: featured ? AppIcons.next : null,
                    onPressed: onBuy,
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

class _MetaItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final bool bold;

  const _MetaItem({
    required this.icon,
    required this.text,
    required this.color,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.body(context).copyWith(
            color: color,
            fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _FoodImage extends StatelessWidget {
  final String image;
  const _FoodImage({required this.image});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final placeholder = ColoredBox(
      color: colors.inputFill,
      child: Center(
        child: Icon(AppIcons.image, size: 40, color: colors.textSecondary),
      ),
    );

    if (image.startsWith('http')) {
      return Image.network(
        image,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => placeholder,
      );
    }
    return Image.asset(
      image,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => placeholder,
    );
  }
}