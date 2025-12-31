import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class PaymentSummaryCard extends StatelessWidget {
  final int total;

  const PaymentSummaryCard({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('결제 정보', style: AppTextStyles.s18w600),
          SizedBox(height: 8),
          Row(
            children: [
              Text('총 상품 금액', style: AppTextStyles.s16w400),
              Spacer(),
              Text(
                NumberFormat.currency(
                  locale: 'ko',
                  symbol: '',
                  decimalDigits: 0,
                ).format(total),
                style: AppTextStyles.s18w600,
              ),
              Text("원", style: AppTextStyles.s18w600),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text('배송비', style: AppTextStyles.s16w400),
              Spacer(),
              Text('0원', style: AppTextStyles.s16w400),
            ],
          ),
          SizedBox(height: 8),
          Divider(),
          SizedBox(height: 8),
          Row(
            children: [
              Text('총 주문금액', style: AppTextStyles.s16w400),
              Spacer(),
              // Text('$total원', style: AppTextStyles.s16w400),
              Text(
                NumberFormat.currency(
                  locale: 'ko',
                  symbol: '',
                  decimalDigits: 0,
                ).format(total),
                style: AppTextStyles.s18w600,
              ),
              Text("원", style: AppTextStyles.s18w600),
            ],
          ),
        ],
      ),
    );
  }
}
