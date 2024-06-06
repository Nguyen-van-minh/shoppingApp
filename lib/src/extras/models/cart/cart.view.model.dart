import 'package:shopping_cart/src/extras/models/product/product.view.model.dart';

class CartViewModel {
  final ProductVieModel? product;
  final int productId;
  final int quantity;
  final int id;
  CartViewModel(
      {required this.productId,
      required this.quantity,
      required this.id,
      this.product});
  factory CartViewModel.fromMap(Map<String, dynamic> map) {
    return CartViewModel(
        quantity: map['quantity'], id: map['id'], productId: map['productId']);
  }
  double getTotalPrice() {
    if (product != null) {
      return product!.price * quantity;
    } else {
      return 0;
    }
  }
}
