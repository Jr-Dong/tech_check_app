import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/widgets/bottom_button.dart';
import 'package:tech_check_app/pages/shopping/widgets/shopping_card_list.dart';
import 'package:tech_check_app/pages/shopping/widgets/shopping_empty_view.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = [1];
    final isEmpty = cartItems.isEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('장바구니')),
      bottomNavigationBar: isEmpty
          ? null
          : BottomButton(text: "구매하기", onPressed: null, hasShadow: true),
      body: isEmpty ? ShoppingEmptyView() : ShoppingCardList(),
    );
  }
}
