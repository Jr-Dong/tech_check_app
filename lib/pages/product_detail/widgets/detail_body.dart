import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Slider;
import 'package:intl/intl.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/product_detail/widgets/carousel_slider_page.dart';

class DetailBody extends StatelessWidget {
  final ProductEntity product;

  const DetailBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          CarouselSliderPage(imageUrl: product.images),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (product.isVerified)
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.checkmark_seal_fill,
                            color: AppColors.secondary500,
                          ),
                          SizedBox(width: 8),
                        ],
                      ),

                    Expanded(
                      child: Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.s18w600.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                  //
                ),
                Row(
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'ko',
                        symbol: '',
                        decimalDigits: 0,
                      ).format(product.price),
                      style: AppTextStyles.s18w600.copyWith(
                        color: AppColors.primary600,
                      ),
                    ),
                    Text(
                      " 원",
                      style: AppTextStyles.s18w600.copyWith(
                        color: AppColors.primary600,
                      ),
                    ),
                  ],
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
                  product.description,
                  style: AppTextStyles.s16w400.copyWith(
                    color: AppColors.textPrimary,
                    //
                  ),
                ),
                SizedBox(height: 12),
                if (product.isVerified)
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
                                Icon(
                                  Icons.star_border,
                                  color: AppColors.secondary400,
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: AppColors.secondary400,
                                ),
                              ],
                            ),
                            //
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                          width: 95,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary100,
                              foregroundColor: AppColors.primary500,
                              elevation: 0,
                            ),
                            child: Text('팔로우', style: AppTextStyles.s16w400),
                            //
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
