import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //TODO 이미지 여기다 추가해야함
      child: ListView(
        padding: EdgeInsets.all(12).copyWith(bottom: 172),
        children: [
          Row(
            children: [
              Text(
                '상품명',
                style: AppTextStyles.s18w600.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(width: 8),
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
          SizedBox(height: 12),
          Text(
            '가나다라마 \n바사아',
            style: AppTextStyles.s16w400.copyWith(
              color: AppColors.textPrimary,
              //
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.background,
            ),
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
                        Icon(Icons.star, color: AppColors.secondary400),
                        Icon(Icons.star, color: AppColors.secondary400),
                        Icon(Icons.star, color: AppColors.secondary400),
                        Icon(Icons.star_border, color: AppColors.secondary400),
                        Icon(Icons.star_border, color: AppColors.secondary400),
                      ],
                    ),
                    //
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(10),
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primary100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '팔로우',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.primary500),
                    //
                  ),
                  //
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
