import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_cart/src/blocs/base/base.state.dart';
import 'package:shopping_cart/src/extras/models/cart/cart.view.model.dart';
part 'cart.state.freezed.dart';

@freezed
class CartState extends BaseBlocState with _$CartState {
  const factory CartState({
    @Default([]) List<CartViewModel> carts,
  }) = _CartState;
}
