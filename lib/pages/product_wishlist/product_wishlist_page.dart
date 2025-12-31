import 'package:flutter/material.dart';
import 'package:tech_check_app/core/widgets/common_app_bar.dart';
import 'package:tech_check_app/core/widgets/common_empty_view.dart';
import 'package:tech_check_app/model/cart_item.dart';
import 'package:tech_check_app/model/product_entity.dart';

class ProductWishlistPage extends StatefulWidget {
  final List<CartItem> shoppingCart;
  final Set<ProductEntity> wishSet;
  final void Function(ProductEntity) onToggleWish;

  const ProductWishlistPage({
    super.key,
    required this.shoppingCart,
    required this.wishSet,
    required this.onToggleWish,
  });

  @override
  State<ProductWishlistPage> createState() => _ProductWishlistPageState();
}

class _ProductWishlistPageState extends State<ProductWishlistPage> {
  void _handleToggleWish(ProductEntity product) {
    setState(() {
      widget.onToggleWish(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text("WishList"),
        centerTitle: true,
        isWish: false,
        shoppingCart: widget.shoppingCart,
        wishSet: widget.wishSet,
        onToggleWish: (product) {
          _handleToggleWish(product);
        },
      ),
      body: widget.wishSet.isEmpty
          ? const CommonEmptyListItem(
              icon: Icons.favorite_border_rounded,
              visualSize: 160,
              title: "찜 목록이 비어있어요",
              description: "마음에 드는 상품을 담아 보세요!",
            )
          : SizedBox(),
      // ProductListItem(
      //     shoppingCart: widget.shoppingCart,
      //     productList: widget.wishSet.toList(),
      //     wishSet: widget.wishSet,
      //     onToggleWish: (product) {
      //       _handleToggleWish(product);
      //     },
      //   ),
    );
  }
}
