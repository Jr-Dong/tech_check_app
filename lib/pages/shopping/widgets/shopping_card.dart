import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';
import 'package:tech_check_app/model/cart_item.dart';

class ShoppingCard extends StatefulWidget {
  final CartItem cartItem;

  const ShoppingCard({super.key, required this.cartItem});

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  late int count = widget.cartItem.quantity;

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
    print(count);
    return Container(
      height: 130,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: 체크 박스 바뀌게 구현
          Icon(
            widget.cartItem.isSelected
                ? Icons.check_box
                : Icons.check_box_outline_blank,
            color: AppColors.border,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    widget.cartItem.product.images[0],
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.cartItem.product.name,
                              style: AppTextStyles.s16w400,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(Icons.close, color: AppColors.gray400),
                        ],
                      ),
                      Row(
                        children: [
                          CounterControl(
                            count: count,
                            countDown: countDown,
                            countUp: countUp,
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                NumberFormat.currency(
                                  locale: 'ko',
                                  symbol: '',
                                  decimalDigits: 0,
                                ).format(widget.cartItem.product.price),
                                style: AppTextStyles.s18w600,
                              ),
                              Text("원", style: AppTextStyles.s18w600),
                            ],
                          ),
                        ],
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
