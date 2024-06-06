import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_cart/src/blocs/base/base.bloc.dart';
import 'package:shopping_cart/src/blocs/home/home.event.dart';
import 'package:shopping_cart/src/blocs/home/home.state.dart';
import 'package:shopping_cart/src/extras/helpers/database.helper.dart';

@Injectable()
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this._database) : super(HomeState()) {
    on<InitData>(
      _onInitData,
      transformer: distinct(),
    );
    on<AddProductToCart>(
      _onAddProductToCart,
      transformer: distinct(),
    );
  }
  final DatabaseHelper _database;
  void _onInitData(InitData event, Emitter<HomeState> emit) async {
    final hotProducts = await _database.getAllProducts(isHot: 1);
    final products = await _database.getAllProducts();
    emit(state.copyWith(products: products, hotProducts: hotProducts));
  }

  void _onAddProductToCart(
      AddProductToCart event, Emitter<HomeState> emit) async {
    await _database
        .addToCart({'productId': event.productId, 'quantity': event.quantity});
  }
}
