import 'package:flutter/material.dart';
import 'package:tech_check_app/core/widgets/bottom_button.dart';
import 'package:tech_check_app/core/widgets/common_empty_view.dart';
import 'package:tech_check_app/model/cart_item.dart';
import 'package:tech_check_app/pages/shopping/widgets/shopping_card_list.dart';

class ShoppingPage extends StatelessWidget {
  final List<CartItem> shoppingCart;
  const ShoppingPage({super.key, required this.shoppingCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('장바구니')),
      bottomNavigationBar: shoppingCart.isEmpty
          ? null
          : BottomButton(text: "구매하기", onPressed: null, hasShadow: true),
      body:
          // shoppingCart.isEmpty
          //     ? CommonEmptyListItem(
          //         title: "장바구니가 비어있어요",
          //         description: "원하는 상품을 담아 보세요!",
          //         icon: Icons.shopping_bag_outlined,
          //         visualSize: 160,
          //       )
          //     :
          ShoppingCardList(shoppingCart: shoppingCart),
    );
  }
}
