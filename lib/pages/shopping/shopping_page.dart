import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 금액 포맷팅을 위해 추가
import 'package:tech_check_app/core/widgets/bottom_button.dart';
import 'package:tech_check_app/core/widgets/common_empty_view.dart';
import 'package:tech_check_app/model/cart_item.dart';
import 'package:tech_check_app/pages/shopping/widgets/shopping_card_list.dart';

class ShoppingPage extends StatefulWidget {
  final List<CartItem> shoppingCart;
  const ShoppingPage({super.key, required this.shoppingCart});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  // 1. 내부 상태 리스트 선언
  late List<CartItem> _items;

  @override
  void initState() {
    super.initState();
    // 상위 위젯으로부터 받은 리스트를 내부 상태로 저장
    _items = widget.shoppingCart;
  }

  // 총합 계산
  int get totalPrice => _items
      .where((item) => item.isSelected)
      .fold(0, (sum, item) => sum + (item.product.price * item.quantity));

  int get selectedCount => _items.where((item) => item.isSelected).length;

  bool get isAllSelected => _items.isNotEmpty && selectedCount == _items.length;

  // 개별 체크 토글
  void toggleSelected(String id) {
    setState(() {
      final targetItem = _items.firstWhere((item) => item.product.id == id);
      targetItem.isSelected = !targetItem.isSelected;
    });
  }

  // 전체 선택/해제
  void toggleAll() {
    bool nextValue = !isAllSelected;
    setState(() {
      for (var item in _items) {
        item.isSelected = nextValue;
      }
    });
  }

  // 수량 증가
  void increaseQuantity(String id) {
    setState(() {
      final item = _items.firstWhere((item) => item.product.id == id);
      item.quantity++;
    });
  }

  // 수량 감소
  void decreaseQuantity(String id) {
    setState(() {
      final item = _items.firstWhere((item) => item.product.id == id);
      if (item.quantity > 1) {
        item.quantity--;
      }
    });
  }

  // 해당 아이템 삭제
  void removeItem(String id) {
    setState(() {
      _items.removeWhere((item) => item.product.id == id);
    });
  }

  // 선택된 아이템 삭제
  void removeSelectedItems() {
    setState(() {
      _items.removeWhere((item) => item.isSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('장바구니')),
      bottomNavigationBar: _items.isEmpty
          ? null
          : BottomButton(
              text: selectedCount > 0
                  ? "${NumberFormat.currency(locale: 'ko', symbol: '', decimalDigits: 0).format(totalPrice)}원 구매하기"
                  : "상품을 선택해주세요",
              onPressed: selectedCount > 0 ? () {} : null, // 선택된 상품 없으면 버튼 비활성화
              hasShadow: true,
            ),
      body: _items.isEmpty
          ? CommonEmptyListItem(
              title: "장바구니가 비어있어요",
              description: "원하는 상품을 담아 보세요!",
              icon: Icons.shopping_bag_outlined,
              visualSize: 160,
            )
          : ShoppingCardList(
              items: _items,
              totalPrice: totalPrice,
              onToggleSelected: toggleSelected,
              onToggleAll: toggleAll,
              onIncrease: increaseQuantity,
              onDecrease: decreaseQuantity,
              onDeleteSelected: removeSelectedItems,
              onRemoveItem: removeItem,
            ),
    );
  }
}
