import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onBack;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.onBack,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return AppBar(
      toolbarHeight: 64,
      backgroundColor: colors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: showBack
          ? IconButton(
        icon: Icon(Icons.arrow_back, size: 20, color: colors.primary),
        onPressed: onBack ?? () => Navigator.maybePop(context),
      )
          : null,
      title: Text(
        title,
        style: AppTextStyles.headlineLarge(context).copyWith(
          color: colors.primary,
        ),
      ),
      actions: actions,
    );
  }
}