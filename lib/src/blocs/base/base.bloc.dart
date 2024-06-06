import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/src/blocs/base/base.event.dart';
import 'package:shopping_cart/src/blocs/base/base.state.dart';
import 'package:shopping_cart/src/blocs/home/home.bloc.dart';
import 'package:shopping_cart/src/extras/navigators/app.router.dart';

import 'mixin/event.transformer.mixin.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S> with EventTransformerMixin {
  BaseBloc(S initialState) : super(initialState);
}

abstract class BaseBlocDelegate<E extends BaseBlocEvent,
    S extends BaseBlocState> extends Bloc<E, S> {
  BaseBlocDelegate(S initialState) : super(initialState);

  // late final AppNavigator navigator;
  late final AppRouter navigator;

  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {}
  }
}
