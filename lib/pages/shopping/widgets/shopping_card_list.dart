import 'package:flutter/material.dart';
import 'package:tech_check_app/model/cart_item.dart';
import 'package:tech_check_app/pages/shopping/widgets/cart_selection_header.dart';
import 'package:tech_check_app/pages/shopping/widgets/payment_summary_card.dart';
import 'package:tech_check_app/pages/shopping/widgets/shopping_card.dart';

class ShoppingCardList extends StatelessWidget {
  final List<CartItem> items;
  final Function(String) onToggleSelected; // int -> String (ID)
  final VoidCallback onToggleAll;
  final Function(String) onIncrease; // int -> String (ID)
  final Function(String) onDecrease; // int -> String (ID)
  final VoidCallback onDeleteSelected; // 선택 삭제 (일괄)
  final Function(String) onRemoveItem; // 개별 삭제 추가
  final int totalPrice;

  const ShoppingCardList({
    super.key,
    required this.items,
    required this.onToggleSelected,
    required this.onToggleAll,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDeleteSelected,
    required this.onRemoveItem,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    // 선택된 아이템 개수 계산
    int selectedCount = items.where((i) => i.isSelected).length;
    // 전체 선택 여부 계산
    bool isAllSelected = items.isNotEmpty && selectedCount == items.length;

    return Column(
      children: [
        // 상단 헤더 (전체 선택 및 선택 삭제)
        CartSelectionHeader(
          selectedCount: selectedCount,
          totalCount: items.length,
          isAllSelected: isAllSelected,
          onToggleAll: onToggleAll,
          onDeleteSelected: onDeleteSelected,
        ),

        // 장바구니 리스트
        Expanded(
          child: ListView.builder(
            itemCount: items.length + 1, // 상품 리스트 + 하단 결제 요약 카드
            itemBuilder: (context, index) {
              if (index < items.length) {
                final item = items[index];
                final String productId = item.product.id; // 고유 ID 추출

                return ShoppingCard(
                  cartItem: item,
                  // 인덱스 대신 고유 ID를 부모 함수로 전달
                  onToggleSelected: () => onToggleSelected(productId),
                  onCountUp: () => onIncrease(productId),
                  onCountDown: () => onDecrease(productId),
                  onRemove: () => onRemoveItem(productId), // 개별 삭제 아이콘 클릭 시
                );
              } else {
                // 리스트의 마지막에 총 금액 요약 카드 표시
                return PaymentSummaryCard(total: totalPrice);
              }
            },
          ),
        ),
      ],
    );
  }
}
