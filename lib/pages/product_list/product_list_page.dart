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
  List<ProductEntity> items = [
    ProductEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: "12",
      description: "1212",
      price: 12345,
      images: ["image1.jpg", "image2.jpg"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 플로팅액션버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductRegister()),
          );
        },
        child: Icon(Icons.add),
      ),
      // 앱바
      appBar: CommonAppBar(
        title: Image.asset('assets/images/techcheck_logo.png', height: 25),
        centerTitle: false,
      ),
      // 바디
      body: items.isEmpty ? EmptylistItem() : ProductListItem(),
    );
  }
}
