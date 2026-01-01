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

  // 카트 추가하는 함수
  void addToCart(ProductEntity product, int quantity) {
    setState(() {
      bool isAlreadyInCart = false;

      // 1. 장바구니를 하나씩 확인합니다.
      for (var item in cartItems) {
        if (item.product.id == product.id) {
          // 2. 똑같은 상품을 찾았다면 수량만 더해줍니다.
          item.quantity += quantity;
          isAlreadyInCart = true;
          break;
        }
      }

      // 3. 끝까지 확인했는데 없다면 새로 추가합니다.
      if (isAlreadyInCart == false) {
        cartItems.add(CartItem(product: product, quantity: quantity));
      }
    });
  }

  // 찜하기 함수
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
        addToCart: addToCart,
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
