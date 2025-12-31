import 'package:flutter/material.dart';
import 'package:tech_check_app/core/widgets/common_app_bar.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/product_list/widgets/product_list_view.dart';

class ProductWishlistPage extends StatelessWidget {
  final Map<ProductEntity, int> shoppingCart;
  const ProductWishlistPage({super.key, required this.shoppingCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text("WishList"),
        centerTitle: true,
        isWish: false,
        shoppingCart: shoppingCart,
      ),
      body: ProductListItem(shoppingCart: shoppingCart, productList: []),
    );
  }
}
