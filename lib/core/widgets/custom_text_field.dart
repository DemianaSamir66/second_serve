import 'package:flutter/material.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    OutlineInputBorder border(Color? color, {double width = 1}) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: color == null
              ? BorderSide.none
              : BorderSide(color: color, width: width),
        );

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      style: AppTextStyles.body(context).copyWith(fontSize: 14),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.body(context).copyWith(
          fontSize: 14,
          color: colors.textSecondary,
        ),
        filled: true,
        fillColor: colors.inputFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        prefixIcon: Icon(icon, color: colors.textSecondary),
        suffixIcon: suffixIcon,
        border: border(null),
        enabledBorder: border(null),
        focusedBorder: border(colors.primary, width: 1.5),
        errorBorder: border(colors.error),
        focusedErrorBorder: border(colors.error, width: 1.5),
      ),
    );
  }
}