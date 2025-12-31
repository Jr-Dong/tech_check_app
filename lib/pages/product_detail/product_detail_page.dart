import 'package:flutter/material.dart';
import 'package:tech_check_app/core/widgets/common_app_bar.dart';
import 'package:tech_check_app/model/cart_item.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/product_detail/widgets/detail_body.dart';
import 'package:tech_check_app/pages/product_detail/widgets/detail_bottom.dart';

class DetailPage extends StatelessWidget {
  final List<CartItem> shoppingCart;
  final Set<ProductEntity> wishSet;
  final void Function(ProductEntity) onToggleWish;
  final ProductEntity product;

  const DetailPage({
    super.key,
    required this.shoppingCart,
    required this.wishSet,
    required this.onToggleWish,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        shoppingCart: shoppingCart,
        wishSet: wishSet,
        onToggleWish: onToggleWish,
      ),
      body: Column(
        children: [
          DetailBody(product: product),
          //
        ],
      ),
      bottomSheet: DetailBottom(product: product),
    );
  }
}
