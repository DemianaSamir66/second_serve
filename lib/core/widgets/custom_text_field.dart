import 'package:flutter/material.dart';
import 'package:second_serve/core/constants/app_icons.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final bool enabled;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hidden = true;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final iconColor = colors.textSecondary;

    Widget? suffix;
    if (widget.isPassword) {
      suffix = IconButton(
        icon: Icon(
          _hidden ? AppIcons.visible : AppIcons.hidden,
          color: iconColor,
          size: 20,
        ),
        onPressed: () => setState(() => _hidden = !_hidden),
      );
    } else if (widget.suffixIcon != null) {
      suffix = Icon(widget.suffixIcon, color: iconColor, size: 20);
    }

    final field = TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && _hidden,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      style: AppTextStyles.body(context),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle:
        AppTextStyles.body(context).copyWith(color: colors.textSecondary),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(widget.prefixIcon, color: iconColor, size: 20),
        suffixIcon: suffix,
      ),
    );

    if (widget.label == null) return field;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label!.toUpperCase(),
          style: AppTextStyles.label(context).copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(height: 8),
        field,
      ],
    );
  }
}