import 'package:flutter/material.dart';
import 'package:tech_check_app/core/widgets/bottom_button.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/shopping/widgets/shopping_card_list.dart';
import 'package:tech_check_app/pages/shopping/widgets/shopping_empty_view.dart';

class ShoppingPage extends StatelessWidget {
  final Map<ProductEntity, int> shoppingCart;
  const ShoppingPage({super.key, required this.shoppingCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('장바구니')),
      bottomNavigationBar: shoppingCart.isEmpty
          ? null
          : BottomButton(text: "구매하기", onPressed: null, hasShadow: true),
      body: shoppingCart.isEmpty
          ? ShoppingEmptyView()
          : ShoppingCardList(shoppingCart: shoppingCart),
    );
  }
}
