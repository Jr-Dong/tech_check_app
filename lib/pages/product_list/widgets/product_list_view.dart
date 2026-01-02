import 'package:flutter/material.dart';
import 'package:tech_check_app/model/cart_item.dart';
import 'package:tech_check_app/model/product_entity.dart';
import 'package:tech_check_app/pages/product_detail/product_detail_page.dart';
import 'package:tech_check_app/pages/product_list/widgets/product_list_card.dart';

// StatefulWidget일 필요 X => StatelessWidget으로 변경
// State클래스에서 StatefulWidget 을 상속받는 클래스의 속성을 복사해서 변수로 사용할 경우
// 부모위젯에서 setState하여 속성 변경하게 되면 상태가 엇갈림.
// 이런 실수 사전에 방지하고자 Stateful이 필수가 아닌 상황에서는 StatelessWidget 사용!
// 성능도 미세하게 더 좋음!(메모리 측면에서)
class ProductListItem extends StatefulWidget {
  final List<CartItem> shoppingCart;
  final Set<ProductEntity> wishSet;
  final List<ProductEntity> productList;
  final void Function(ProductEntity) onToggleWish;
  final void Function(ProductEntity, int) addToCart;

  const ProductListItem({
    super.key,
    required this.productList,
    required this.shoppingCart,
    required this.wishSet,
    required this.onToggleWish,
    required this.addToCart,
  });

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
        childAspectRatio: 0.75,
      ),
      itemCount: widget.productList.length,
      itemBuilder: (context, index) {
        final product = widget.productList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  product: product,
                  addToCart: widget.addToCart,
                  shoppingCart: widget.shoppingCart,
                  wishSet: widget.wishSet,
                  onToggleWish: widget.onToggleWish,
                ),
              ),
            );
          },
          child: ProductCard(
            product: product,
            index: index,
            shoppingCart: widget.shoppingCart,
            wishSet: widget.wishSet,
            onToggleWish: (product) {
              setState(() {
                widget.onToggleWish(product); // 상위에서 wishSet 갱신
              });
            },
          ),
        );
      },
    );
  }
}
