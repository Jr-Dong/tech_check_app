import 'package:tech_check_app/model/product_entity.dart';

class CartItem {
  final ProductEntity product;
  int quantity;
  bool isSelected;

  CartItem({required this.product, this.quantity = 1, this.isSelected = true});
}
