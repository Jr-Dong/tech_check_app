import 'package:flutter/material.dart';
import 'package:tech_check_app/core/widgets/common_app_bar.dart';
import 'package:tech_check_app/core/widgets/common_empty_view.dart';
import 'package:tech_check_app/model/cart_item.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/product_list/widgets/product_list_view.dart';
import 'package:tech_check_app/pages/product_register/product_register_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // 프로덕트 리스트
  List<ProductEntity> productList = [];
  List<CartItem> cartItems = [];
  Set<ProductEntity> wishSet = {};

  void onCreate(ProductEntity item) {
    setState(() {
      productList.add(item);
    });
  }

  void addToCart(ProductEntity product) {
    setState(() {
      final index = cartItems.indexWhere(
        (item) => item.product.id == product.id,
      );

      if (index != -1) {
        cartItems[index].quantity += 1;
      } else {
        cartItems.add(
          CartItem(product: product, quantity: 1, isSelected: true),
        );
      }
    });
  }

  void onToggleWish(ProductEntity item) {
    setState(() {
      if (wishSet.contains(item)) {
        wishSet.remove(item);
      } else {
        wishSet.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 플로팅액션버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductRegister(onCreate: onCreate),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      // 앱바
      appBar: CommonAppBar(
        title: Image.asset('assets/images/techcheck_logo.png', height: 25),
        centerTitle: false,
        shoppingCart: cartItems,
        wishSet: wishSet,
        onToggleWish: onToggleWish,
      ),
      // 바디
      body: productList.isEmpty
          ? const CommonEmptyListItem(
              imagePath: 'assets/images/empty_page.png',
              title: "등록된 상품이 없습니다.",
              description: "+ 버튼을 눌러 첫 상품을 등록해보세요!",
            )
          : ProductListItem(
              addToCart: addToCart,
              productList: productList,
              shoppingCart: cartItems,
              wishSet: wishSet,
              onToggleWish: onToggleWish,
            ),
    );
  }
}
