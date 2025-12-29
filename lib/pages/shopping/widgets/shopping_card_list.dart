import 'package:flutter/material.dart';
import 'package:tech_check_app/pages/shopping/widgets/cart_selection_header.dart';
import 'package:tech_check_app/pages/shopping/widgets/payment_summary_card.dart';
import 'package:tech_check_app/pages/shopping/widgets/shopping_card.dart';

class ShoppingCardList extends StatelessWidget {
  const ShoppingCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartSelectionHeader(selectedCount: 3, totalCount: 3),
        Expanded(
          child: ListView(
            children: [
              // 쇼핑 카트 이미지
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ShoppingCard(
                    productName: '아이폰 13 미니',
                    productPrice: 100000,
                  );
                },
              ),
              // 결제 정보
              PaymentSummaryCard(total: 1000),
            ],
          ),
        ),
      ],
    );
  }
}
