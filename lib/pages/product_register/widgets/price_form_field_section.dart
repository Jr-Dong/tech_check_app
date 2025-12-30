import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class PriceFormFieldSection extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String hint;
  final String? Function(String?)? validator;

  const PriceFormFieldSection({
    super.key,
    this.controller,
    required this.label,
    required this.hint,
    this.validator,
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
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hint: Text(
              hint,
              style: AppTextStyles.s12w400.copyWith(color: AppColors.gray400),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                "원",
                style: AppTextStyles.s16w400.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            suffixIconConstraints: BoxConstraints(),
          ),
          inputFormatters: [
            // 1000 단위 콤마 찍기
            CurrencyTextInputFormatter.currency(
              locale: 'ko',
              symbol: '',
              decimalDigits: 0,
            ),
            LengthLimitingTextInputFormatter(9),
          ],
          validator: validator,
        ),
      ],
    );
  }
}
