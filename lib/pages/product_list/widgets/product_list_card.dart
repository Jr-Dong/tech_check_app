import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';
import 'package:tech_check_app/model/cart_item.dart';
import 'package:tech_check_app/model/product_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  final int index;

  final List<CartItem> shoppingCart;
  final Set<ProductEntity> wishSet;
  final void Function(ProductEntity) onToggleWish;

  const ProductCard({
    super.key,
    required this.product,

    required this.index,
    required this.shoppingCart,
    required this.wishSet,
    required this.onToggleWish,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFavorite = wishSet.contains(product);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 이미지
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
              // 이미지 속 하트버튼
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    onToggleWish(product);
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    color: isFavorite ? AppColors.heartPink : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            if (product.isVerified)
              Icon(
                CupertinoIcons.checkmark_seal_fill,
                color: AppColors.secondary500,
                size: 14,
              ),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                product.name,
                style: AppTextStyles.s18w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        product.price == 0
            ? Text("무료", style: AppTextStyles.s18w600)
            : Row(
                children: [
                  Text(
                    NumberFormat.currency(
                      locale: 'ko',
                      symbol: '',
                      decimalDigits: 0,
                    ).format(product.price),
                    style: AppTextStyles.s18w600,
                  ),
                  Text("원", style: AppTextStyles.s18w600),
                ],
              ),
      ],
    );
  }
}
