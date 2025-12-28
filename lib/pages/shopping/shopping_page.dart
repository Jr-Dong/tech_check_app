import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('장바구니')),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                    Text(
                      '전체 선택 (3/3)',
                      style: AppTextStyles.s11w500.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  '선택 삭제',
                  style: AppTextStyles.s11w500.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          // 쇼핑 카트 이미지
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.check)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        'https://picsum.photos/85',
                        width: 85,
                        height: 85,
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('상품 이름 예시', style: AppTextStyles.s16w400),
                        Text('19,800원', style: AppTextStyles.s18w600),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 결제 정보
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('결제 정보', style: AppTextStyles.s18w600),
                Row(
                  children: [
                    Text('총 상품 금액', style: AppTextStyles.s16w400),
                    Spacer(),
                    Text('59,400원', style: AppTextStyles.s16w400),
                  ],
                ),
                Row(
                  children: [
                    Text('배송비', style: AppTextStyles.s16w400),
                    Spacer(),
                    Text('0원', style: AppTextStyles.s16w400),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text('총 주문금액', style: AppTextStyles.s16w400),
                    Spacer(),
                    Text('59,400원', style: AppTextStyles.s16w400),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
