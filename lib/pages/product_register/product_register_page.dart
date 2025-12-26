import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class ProductRegister extends StatelessWidget {
  const ProductRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "내 물건 팔기",
          style: AppTextStyles.s20w600.copyWith(color: AppColors.textPrimary),
        ),
      ),
      body: Column(),
    );
  }
}
