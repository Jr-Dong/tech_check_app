import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class FormFieldSection extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final int minLines;

  const FormFieldSection({
    super.key,
    this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.minLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.s16w400.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          minLines: minLines,
          maxLines: minLines == 1 ? 1 : null,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.s12w400.copyWith(color: AppColors.gray400),
          ),
        ),
      ],
    );
  }
}
