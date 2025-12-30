import 'package:flutter/material.dart';
import 'package:tech_check_app/core/widgets/common_app_bar.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/product_detail/widgets/detail_body.dart';
import 'package:tech_check_app/pages/product_detail/widgets/detail_bottom.dart';

class DetailPage extends StatelessWidget {
  final Map<ProductEntity, int> shoppingCart;
  const DetailPage({super.key, required this.shoppingCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(shoppingCart: shoppingCart),
      body: Column(
        children: [
          DetailBody(),
          //
        ],
      ),
      bottomSheet: DetailBottom(),
    );
  }
}
