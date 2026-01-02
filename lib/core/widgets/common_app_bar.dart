import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/model/cart_item.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/product_wishlist/product_wishlist_page.dart';
import 'package:tech_check_app/pages/shopping/shopping_page.dart';

// PreferredSizeWidget 대신 AppBar를 상속받아서 구현해보기
/// 공통 AppBar 컴포넌트
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool centerTitle;
  final bool isWish;
  final List<CartItem> shoppingCart;
  final Set<ProductEntity> wishSet;
  final void Function(ProductEntity) onToggleWish;
  final void Function(ProductEntity, int) addToCart;

  const CommonAppBar({
    super.key,
    this.title,
    this.centerTitle = false,
    this.isWish = true,
    required this.shoppingCart,
    required this.wishSet,
    required this.onToggleWish,
    required this.addToCart,
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
                  builder: (context) => ProductWishlistPage(
                    addToCart: addToCart,
                    shoppingCart: shoppingCart,
                    wishSet: wishSet,
                    onToggleWish: onToggleWish,
                  ),
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
