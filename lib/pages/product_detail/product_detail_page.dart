import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_check_app/pages/product_detail/widgets/detail_body.dart';
import 'package:tech_check_app/pages/product_detail/widgets/detail_bottom.dart';
import 'package:tech_check_app/pages/product_detail/widgets/detail_image.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.back, size: 28),
        actions: [
          Icon(Icons.favorite_border, size: 24),
          SizedBox(width: 12),
          Icon(Icons.shopping_bag_outlined, size: 24),
          SizedBox(width: 12),
        ],
        //
      ),
      body: Column(
        children: [
          DetailImage(), 
          DetailBody(),
          //
        ],
      ),
      bottomSheet: DetailBottom(),
    );
  }
}
