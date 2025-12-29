import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class DetailBottom extends StatelessWidget {
  const DetailBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        width: double.infinity,
        height: 150,
        child: Column(
          children: [
            Row(
              children: [
                Icon(CupertinoIcons.minus_circle, color: AppColors.gray400),
                SizedBox(width: 19),
                Text("1"),
                SizedBox(width: 19),
                Icon(CupertinoIcons.plus_circle, color: AppColors.gray400),
                Spacer(),
                Text(
                  "총 380,000 원",
                  style: AppTextStyles.s20w600.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.favorite_border, color: AppColors.textSecondary),
                SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.primary100,
                    ),

                    child: Text('장바구니', style: AppTextStyles.s16w400),
                    //
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('구매하기', style: AppTextStyles.s16w400),
                    //
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
