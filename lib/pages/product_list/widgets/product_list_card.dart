import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/product_detail/product_detail_page.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final String imageUrl;
  final int index;
  final bool isFavorite;
  final ValueChanged<bool> onFavoriteToggle;
  final Map<ProductEntity, int> shoppingCart;
  final bool isVerified;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.index,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.shoppingCart,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(shoppingCart: shoppingCart),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이미지
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
                // 이미지 속 하트버튼
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      onFavoriteToggle(!isFavorite);
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
              Text(name, style: AppTextStyles.s18w500),
              SizedBox(width: 4),
              if (isVerified)
                Icon(
                  CupertinoIcons.checkmark_seal_fill,
                  color: AppColors.secondary500,
                  size: 14,
                ),
            ],
          ),
          price == 0
              ? Text("무료", style: AppTextStyles.s18w600)
              : Row(
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'ko',
                        symbol: '',
                        decimalDigits: 0,
                      ).format(price),
                      style: AppTextStyles.s18w600,
                    ),
                    Text("원", style: AppTextStyles.s18w600),
                  ],
                ),
        ],
      ),
    );
  }
}
