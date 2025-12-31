import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';
import 'package:tech_check_app/core/widgets/counter_control.dart';
import 'package:tech_check_app/model/product_entity.dart';

class DetailBottom extends StatefulWidget {
  const DetailBottom({
    super.key,
    required this.product,
    required this.addToCart,
  });
  final ProductEntity product;
  final void Function(ProductEntity) addToCart;

  @override
  State<DetailBottom> createState() => _DetailBottomState();
}

class _DetailBottomState extends State<DetailBottom> {
  int count = 1;

  void countUp() {
    setState(() {
      count++;
    });
  }

  void countDown() {
    setState(() {
      count--;
    });
  }

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
                CounterControl(
                  count: count,
                  countUp: countUp,
                  countDown: countDown,
                ),
                Spacer(),
                Text(
                  "총",
                  style: AppTextStyles.s18w600.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  NumberFormat.currency(
                    locale: 'ko',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(widget.product.price),
                  style: AppTextStyles.s18w600.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "원",
                  style: AppTextStyles.s18w600.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () {
                      widget.addToCart(widget.product);
                    },
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
