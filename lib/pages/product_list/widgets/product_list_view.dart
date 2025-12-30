import 'package:flutter/material.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/product_list/widgets/product_list_card.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem({super.key, required this.productList});
  final List<ProductEntity> productList;

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  Map<int, bool> favoriteMap = {};

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
        return ProductCard(
          name: product.name,
          price: "${product.price}원",
          index: index,
          isFavorite: favoriteMap[index] ?? false,
          onFavoriteToggle: (newValue) {
            setState(() {
              favoriteMap[index] = newValue;
            });
          },
        );
      },
    );
  }
}
