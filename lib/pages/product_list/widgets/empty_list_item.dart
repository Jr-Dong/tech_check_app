import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class EmptylistItem extends StatelessWidget {
  const EmptylistItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(flex: 1),
          Image.asset('assets/images/empty_page.png', height: 190),
          Text(
            "등록된 상품이 없습니다.",
            style: AppTextStyles.s20w600.copyWith(color: AppColors.textPrimary),
          ),
          Text(
            "+ 버튼을 눌러 첫 상품을 등록해보세요!",
            style: AppTextStyles.s18w500.copyWith(color: AppColors.gray400),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
