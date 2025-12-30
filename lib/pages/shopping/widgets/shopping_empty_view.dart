import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';
import 'package:tech_check_app/pages/product_list/product_list_page.dart';

class ShoppingEmptyView extends StatelessWidget {
  const ShoppingEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: const Offset(0, -90),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.background,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(24),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 80,
                color: AppColors.gray400,
              ),
            ),
            SizedBox(height: 21),
            Text(
              "장바구니가 비어있어요",
              style: AppTextStyles.s20w600.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "원하는 상품을 담아 보세요!",
              style: AppTextStyles.s16w400.copyWith(color: AppColors.gray400),
            ),
            SizedBox(height: 21),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductListPage(),
                  ),
                  (route) => false,
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primary400,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                "상품 보러가기",
                style: AppTextStyles.s16w400.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
