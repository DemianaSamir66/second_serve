import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:second_serve/core/constants/app_assets.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class Onboarding2 extends StatelessWidget {
  final VoidCallback? onSkip;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  const Onboarding2({
    super.key,
    this.onSkip,
    this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(22, 11, 18, 45),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: onSkip,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      minimumSize: const Size(42, 31),
                    ),
                    child: Text(
                      'skip'.tr(),
                      style: AppTextStyles.body(context).copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: colors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                AspectRatio(
                  aspectRatio: 362 / 455,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      AppAssets.onboarding2,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: colors.inputFill,
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 45,
                            color: colors.textSecondary,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _dot(colors.textSecondary, 6),
                      const SizedBox(width: 9),
                      _dot(colors.textPrimary, 9),
                      const SizedBox(width: 9),
                      _dot(colors.textSecondary, 6),
                    ],
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  'onboarding2_title'.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body(context).copyWith(
                    fontSize: 33.9,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'onboarding2_description'.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body(context).copyWith(
                    fontSize: 12,
                    height: 1.6,
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 14),
                _navigationBar(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navigationBar(BuildContext context) {
    final colors = AppColors.of(context);

    return Container(
      width: 226,
      height: 64,
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: onPrevious,
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: 1.5,
            height: 24,
            color: colors.onPrimary,
          ),
          Expanded(
            child: IconButton(
              onPressed: onNext,
              icon: Icon(
                Icons.arrow_forward,
                color: colors.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
