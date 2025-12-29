import 'package:flutter/material.dart';
import 'package:tech_check_app/core/widgets/common_app_bar.dart';
import 'package:tech_check_app/pages/product_detail/widgets/detail_body.dart';
import 'package:tech_check_app/pages/product_detail/widgets/detail_bottom.dart';
import 'package:tech_check_app/pages/product_detail/widgets/detail_image.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
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
