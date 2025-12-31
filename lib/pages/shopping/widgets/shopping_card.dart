import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';
import 'package:tech_check_app/core/widgets/counter_control.dart';
import 'package:tech_check_app/model/cart_item.dart';

class ShoppingCard extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onToggleSelected;
  final VoidCallback onCountUp;
  final VoidCallback onCountDown;
  final VoidCallback onRemove;

  const ShoppingCard({
    super.key,
    required this.cartItem,
    required this.onToggleSelected,
    required this.onCountUp,
    required this.onCountDown,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// 1. 체크박스 영역
          GestureDetector(
            onTap: onToggleSelected,
            child: Icon(
              cartItem.isSelected
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: cartItem.isSelected
                  ? AppColors.secondary500
                  : AppColors.border,
            ),
          ),
          const SizedBox(width: 12),

          /// 2. 상품 정보 영역 (이미지 + 텍스트 Column)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상품 이미지
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    cartItem.product.images[0],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                // 상품 상세 정보 (이름, 카운터, 가격)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              cartItem.product.name,
                              style: AppTextStyles.s16w400,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              onRemove();
                            },
                            child: Icon(
                              Icons.close,
                              color: AppColors.gray400,
                              size: 20,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CounterControl(
                            count: cartItem.quantity,
                            countUp: onCountUp,
                            countDown: onCountDown,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                NumberFormat.currency(
                                  locale: 'ko',
                                  symbol: '',
                                  decimalDigits: 0,
                                ).format(
                                  cartItem.product.price * cartItem.quantity,
                                ),
                                style: AppTextStyles.s18w600,
                              ),
                              const Text("원", style: AppTextStyles.s18w600),
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
