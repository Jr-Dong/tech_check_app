import 'package:flutter/material.dart';
import 'package:tech_check_app/model/cart_item.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/product_detail/product_detail_page.dart';
import 'package:tech_check_app/pages/product_list/widgets/product_list_card.dart';

class ProductListItem extends StatefulWidget {
  final List<CartItem> shoppingCart;
  final Set<ProductEntity> wishSet;
  final List<ProductEntity> productList;
  final void Function(ProductEntity) onToggleWish;

  const ProductListItem({
    super.key,
    required this.productList,
    required this.shoppingCart,
    required this.wishSet,
    required this.onToggleWish,
  });

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
        childAspectRatio: 0.75,
      ),
      itemCount: widget.productList.length,
      itemBuilder: (context, index) {
        final product = widget.productList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  shoppingCart: widget.shoppingCart,
                  wishSet: widget.wishSet,
                  onToggleWish: widget.onToggleWish,
                ),
              ),
            );
          },
          child: ProductCard(
            product: product,
            imageUrl: product.images[0],
            name: product.name,
            price: product.price,
            index: index,
            shoppingCart: widget.shoppingCart,
            wishSet: widget.wishSet,
            isVerified: product.isVerified,
            onToggleWish: (product) {
              setState(() {
                widget.onToggleWish(product); // 상위에서 wishSet 갱신
              });
            },
          ),
        );
      },
    );
  }
}
