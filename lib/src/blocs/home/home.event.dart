import '../base/base.event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home.event.freezed.dart';

abstract class HomeEvent extends BaseBlocEvent {}

@freezed
class InitData extends HomeEvent with _$InitData {
  const factory InitData() = _InitData;
}

@freezed
class AddProductToCart extends HomeEvent with _$AddProductToCart {
  const factory AddProductToCart(
      {required int productId, required int quantity}) = _AddProductToCart;
}
