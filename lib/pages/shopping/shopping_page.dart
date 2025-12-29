import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/pages/shopping/widgets/shopping_card_list.dart';
import 'package:tech_check_app/pages/shopping/widgets/shopping_empty_view.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = [];
    final isEmpty = cartItems.isEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('장바구니')),
      // TODO: 바텀시트 값 통일하기
      bottomNavigationBar: isEmpty
          ? null
          : SafeArea(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("구매하기"),
                  ),
                ),
              ),
            ),
      // TODO: 장바구니 비었을 때 뷰 연결
      body: isEmpty ? ShoppingEmptyView() : ShoppingCardList(),
    );
  }
}
