import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_cart/src/blocs/base/base.bloc.dart';
import 'package:shopping_cart/src/blocs/cart/cart.event.dart';
import 'package:shopping_cart/src/blocs/cart/cart.state.dart';
import 'package:shopping_cart/src/extras/helpers/database.helper.dart';
import 'package:shopping_cart/src/extras/models/cart/cart.view.model.dart';

@Injectable()
class CartBloc extends BaseBloc<CartEvent, CartState> {
  CartBloc(this._database) : super(const CartState()) {
    on<InitData>(
      _onInitData,
      // transformer: distinct(),
    );
    on<RemoveProductToCart>(
      _onRemoveProductToCart,
      // transformer: distinct(),
    );
    on<RemoveAllCart>(
      _onRemoveAllCart,
      // transformer: distinct(),
    );
  }
  final DatabaseHelper _database;
  void _onInitData(InitData event, Emitter<CartState> emit) async {
    final cartsResponse = await _database.getAllCarts();
    List<CartViewModel> carts = [];
    for (var cart in cartsResponse) {
      final product = await _database.getProductById(cart.productId);
      carts.add(CartViewModel(
          productId: cart.productId,
          quantity: cart.quantity,
          id: cart.id,
          product: product));
    }
    emit(state.copyWith(carts: carts));
  }

  void _onRemoveProductToCart(
      RemoveProductToCart event, Emitter<CartState> emit) async {
    await _database.removeFromCart(event.cartId);
    final updatedCarts = List<CartViewModel>.from(state.carts)
      ..removeWhere((item) => item.id == event.cartId);

    emit(state.copyWith(carts: updatedCarts));
  }

  void _onRemoveAllCart(RemoveAllCart event, Emitter<CartState> emit) async {
    await _database.deleteAllCarts();
    emit(state.copyWith(carts: []));
  }
}
