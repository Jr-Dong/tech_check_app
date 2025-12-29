import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';
import 'package:tech_check_app/pages/product_list/widgets/empty_list_item.dart';
import 'package:tech_check_app/pages/product_list/widgets/product_list_item.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // 프로덕트 리스트
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 플로팅액션버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 40),
      ),
      // 앱바
      appBar: AppBar(
        title: Image.asset('assets/images/techcheck_logo.png', height: 25),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
        ],
        shape: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      // 바디
      body: items.isEmpty ? EmptylistItem() : ProductListItem(),
    );
  }
}
