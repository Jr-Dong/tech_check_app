import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

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
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network("https://picsum.photos/400/320"),
          ),
          Row(
            children: [
              Text(
                '상품명',
                style: AppTextStyles.s18w600.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              Icon(
                CupertinoIcons.checkmark_seal_fill,
                color: AppColors.secondary500,
              ),
            ],
            //
          ),
          Text(
            '380,000 원',
            style: AppTextStyles.s18w600.copyWith(
              color: AppColors.primary600,
              //
            ),
          ),
          Divider(),
          // flutter 디바이더 위젯 넣어야함
          Text(
            '상품설명',
            style: AppTextStyles.s12w400.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 11),
          Text(
            '내용',
            style: AppTextStyles.s16w400.copyWith(
              color: AppColors.textPrimary,
              //
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(9),
            color: AppColors.background,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: Image.network("https://picsum.photos/35/35"),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "검수자 이름",
                      style: AppTextStyles.s11w500.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.secondary500),
                        Icon(Icons.star, color: AppColors.secondary500),
                        Icon(Icons.star, color: AppColors.secondary500),
                        Icon(Icons.star_border, color: AppColors.secondary500),
                        Icon(Icons.star_border, color: AppColors.secondary500),
                      ],
                    ),
                    //
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(10),
                  width: 80,
                  decoration: BoxDecoration(color: AppColors.primary100),
                  child: Text('팔로우', textAlign: TextAlign.center),
                  //
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(color: Colors.grey),
        width: double.infinity,
        child: Row(
          children: [
            Icon(CupertinoIcons.minus_circle),
            SizedBox(width: 19),
            Text("1"),
            SizedBox(width: 19),
            Icon(CupertinoIcons.plus_circle),
            Spacer(),
            Text("총 380,000 원"),
            //
          ],
        ),
      ),
    );
  }
}
