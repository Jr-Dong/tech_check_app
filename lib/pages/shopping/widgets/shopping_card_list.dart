import 'package:flutter/material.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/shopping/widgets/cart_selection_header.dart';
import 'package:tech_check_app/pages/shopping/widgets/payment_summary_card.dart';
import 'package:tech_check_app/pages/shopping/widgets/shopping_card.dart';

class ShoppingCardList extends StatelessWidget {
  final Map<ProductEntity, int> shoppingCart;

  const ShoppingCardList({super.key, required this.shoppingCart});

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
                itemCount: shoppingCart.length,
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
