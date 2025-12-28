import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class PriceFormFieldSection extends StatelessWidget {
  final String label;
  final String hint;
  const PriceFormFieldSection({
    super.key,
    required this.label,
    required this.hint,
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
        SizedBox(height: 8),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(right: 30, left: 16),
                hint: Text(
                  hint,
                  style: AppTextStyles.s12w400.copyWith(
                    color: AppColors.gray400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                '원',
                style: AppTextStyles.s16w400.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
