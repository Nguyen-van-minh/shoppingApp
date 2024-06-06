import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_cart/src/blocs/base/base.state.dart';
import 'package:shopping_cart/src/extras/models/product/product.view.model.dart';
part 'home.state.freezed.dart';

@freezed
class HomeState extends BaseBlocState with _$HomeState {
  const factory HomeState({
    @Default([]) List<ProductVieModel> products,
    @Default([]) List<ProductVieModel> hotProducts,
  }) = _HomeState;
}
