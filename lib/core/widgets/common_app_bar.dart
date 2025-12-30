import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/product_wishlist/product_wishlist_page.dart';
import 'package:tech_check_app/pages/shopping/shopping_page.dart';

/// 공통 AppBar 컴포넌트
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool centerTitle;
  final bool isWish;
  final Map<ProductEntity, int> shoppingCart;

  const CommonAppBar({
    super.key,
    this.title,
    this.centerTitle = false,
    this.isWish = true,
    required this.shoppingCart,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      actions: [
        if (isWish)
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductWishlistPage(shoppingCart: shoppingCart),
                ),
              );
            },
            icon: const Icon(Icons.favorite_outline),
            color: AppColors.textSecondary,
          ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShoppingPage(shoppingCart: shoppingCart),
              ),
            );
          },
          icon: const Icon(Icons.shopping_bag_outlined),
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: 8),
      ],
      shape: Border(bottom: BorderSide(color: AppColors.border)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
