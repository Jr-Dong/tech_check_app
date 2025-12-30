import 'package:flutter/material.dart';
import 'package:tech_check_app/core/widgets/common_app_bar.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/product_list/widgets/empty_list_item.dart';
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
  Map<ProductEntity, int> shoppingCart = {};
  Set<ProductEntity> wishSet = {};

  void onCreate(ProductEntity item) {
    setState(() {
      productList.add(item);
    });
  }

  void addToCart(ProductEntity product) {
    setState(() {
      if (shoppingCart.containsKey(product)) {
        final currentCount = shoppingCart[product]!;
        shoppingCart[product] = currentCount + 1;
      } else {
        shoppingCart[product] = 1;
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
        shoppingCart: shoppingCart,
      ),
      // 바디
      body: productList.isEmpty
          ? EmptylistItem()
          : ProductListItem(productList: productList, shoppingCart: shoppingCart),
    );
  }
}
