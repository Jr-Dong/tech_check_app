import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';
import 'package:tech_check_app/core/widgets/counter_control.dart';
import 'package:tech_check_app/model/cart_item.dart';

class ShoppingCard extends StatelessWidget {
  final CartItem cartItem;

  const ShoppingCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
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
            cartItem.isSelected
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
                    'https://picsum.photos/100/100',
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
                              cartItem.product.name,
                              style: AppTextStyles.s16w400,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(Icons.close, color: AppColors.gray400),
                        ],
                      ),
                      Row(
                        children: [
                          /// 오류 나서 임시로 값 넣어줌
                          // CounterControl(count: 0),
                          Spacer(),
                          Text(
                            '${cartItem.product.price}원',
                            style: AppTextStyles.s18w600,
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
