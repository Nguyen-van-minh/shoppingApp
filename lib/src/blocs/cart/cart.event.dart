import '../base/base.event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart.event.freezed.dart';

abstract class CartEvent extends BaseBlocEvent {}

@freezed
class InitData extends CartEvent with _$InitData {
  const factory InitData() = _InitData;
}

@freezed
class RemoveProductToCart extends CartEvent with _$RemoveProductToCart {
  const factory RemoveProductToCart({required int cartId}) =
      _RemoveProductToCart;
}

@freezed
class RemoveAllCart extends CartEvent with _$RemoveAllCart {
  const factory RemoveAllCart() = _RemoveAllCart;
}
