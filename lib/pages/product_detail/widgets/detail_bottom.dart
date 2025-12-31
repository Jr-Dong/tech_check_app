import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';
import 'package:tech_check_app/core/widgets/counter_control.dart';
import 'package:tech_check_app/model/cart_item.dart';
import 'package:tech_check_app/model/product_entity.dart';

class DetailBottom extends StatefulWidget {
  const DetailBottom({
    super.key,
    required this.product,
    required this.addToCart,
    required this.shoppingCart,
    required this.onToggleWish,
    required this.wishSet,
  });
  final ProductEntity product;
  final void Function(ProductEntity, int) addToCart;
  final List<CartItem> shoppingCart;
  final void Function(ProductEntity) onToggleWish;
  final Set<ProductEntity> wishSet;

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
    final bool isFavorite = widget.wishSet.contains(widget.product);

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
                  ).format(widget.product.price * count),
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
                  onPressed: () {
                    widget.onToggleWish(widget.product);
                    setState(() {});
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    color: isFavorite
                        ? AppColors.heartPink
                        : AppColors.textSecondary,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () {
                      widget.addToCart(widget.product, count);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '장바구니에 ${widget.product.name}을(를) $count개가 담았습니다.',
                          ),
                          duration: const Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
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
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text("구매 안내"),
                            content: Text("해당 상품을 구매하겠습니까?"),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                textStyle: TextStyle(color: Colors.red),
                                child: Text('취소'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                child: Text('확인'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      content: Text(
                                        "${widget.product.name}을(를) $count개 구매했습니다",
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
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
