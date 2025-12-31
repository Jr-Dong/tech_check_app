import 'package:flutter/material.dart';
import 'package:tech_check_app/model/cart_item.dart';
import 'package:tech_check_app/pages/shopping/widgets/cart_selection_header.dart';
import 'package:tech_check_app/pages/shopping/widgets/payment_summary_card.dart';
import 'package:tech_check_app/pages/shopping/widgets/shopping_card.dart';

class ShoppingCardList extends StatelessWidget {
  final List<CartItem> shoppingCart;

  const ShoppingCardList({super.key, required this.shoppingCart});

  @override
  int calculateTotalPrice(List<CartItem> cartItems) {
    int totalPrice = cartItems.fold(0, (previousValue, item) {
      return previousValue + (item.product.price * item.quantity);
    });
    return totalPrice;
  }

  Widget build(BuildContext context) {
    final int totalPrice = calculateTotalPrice(shoppingCart);

    return Column(
      children: [
        CartSelectionHeader(
          selectedCount: shoppingCart.length,
          totalCount: shoppingCart.length,
          isAllSelected: false,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: shoppingCart.length + 1,
            itemBuilder: (context, index) {
              if (index < shoppingCart.length) {
                final item = shoppingCart[index];
                return ShoppingCard(cartItem: item);
              } else {
                return PaymentSummaryCard(total: totalPrice);
              }
            },
          ),
        ),
      ],
    );
  }
}
