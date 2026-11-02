// This file is reserved for future implementation.
import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

/// شريط أخضر فوق (عنوان + رجوع) والصورة نازلة عليه، تحتها الاسم.
/// - onEditProfile != null  → زرار "Edit Profile" (شاشة Profile)
/// - onChangePhoto != null  → بادج كاميرا + نص "Tap to change..." (شاشة Edit Profile)
class ProfileHeader extends StatelessWidget {
  final String title;
  final String name;
  final String? image; // رابط (http) أو مسار asset
  final VoidCallback? onBack;
  final VoidCallback? onEditProfile;
  final VoidCallback? onChangePhoto;
  final String editLabel;
  final String changePhotoHint;

  const ProfileHeader({
    super.key,
    required this.title,
    required this.name,
    this.image,
    this.onBack,
    this.onEditProfile,
    this.onChangePhoto,
    this.editLabel = 'Edit Profile',
    this.changePhotoHint = 'Tap to change profile picture',
  });

  static const double _avatar = 96;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final topPad = MediaQuery.paddingOf(context).top;
    final bandHeight = topPad + 104;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: bandHeight + _avatar / 2,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: bandHeight,
                child: ColoredBox(
                  color: colors.primary,
                  child: Padding(
                    padding: EdgeInsets.only(top: topPad),
                    child: SizedBox(
                      height: 56,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (onBack != null)
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: IconButton(
                                onPressed: onBack,
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 18,
                                  color: colors.onPrimary,
                                ),
                              ),
                            ),
                          Text(
                            title,
                            style: AppTextStyles.title(context).copyWith(
                              color: colors.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: bandHeight - _avatar / 2,
                left: 0,
                right: 0,
                child: Center(child: _buildAvatar(colors)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle(context).copyWith(
            color: colors.primary,
          ),
        ),
        if (onEditProfile != null) ...[
          const SizedBox(height: 8),
          Material(
            color: colors.primary,
            shape: const StadiumBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onEditProfile,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                child: Text(
                  editLabel,
                  style: AppTextStyles.caption(context).copyWith(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
        if (onChangePhoto != null) ...[
          const SizedBox(height: 6),
          Text(
            changePhotoHint,
            style: AppTextStyles.bodySmall(context).copyWith(
              color: colors.textMuted,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildAvatar(AppColors colors) {
    return GestureDetector(
      onTap: onChangePhoto,
      child: SizedBox(
        width: _avatar,
        height: _avatar,
        child: Stack(
          children: [
            Container(
              width: _avatar,
              height: _avatar,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.primaryTint,
                border: Border.all(color: colors.surface, width: 4),
              ),
              child: ClipOval(child: _image(colors)),
            ),
            if (onChangePhoto != null)
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.primary,
                    border: Border.all(color: colors.surface, width: 2),
                  ),
                  child: Icon(Icons.camera_alt,
                      size: 14, color: colors.onPrimary),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _image(AppColors colors) {
    final fallback = Icon(Icons.person, size: 48, color: colors.primary);
    if (image == null || image!.isEmpty) return fallback;
    if (image!.startsWith('http')) {
      return Image.network(
        image!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => fallback,
      );
    }
    return Image.asset(
      image!,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => fallback,
    );
  }
}