// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shopping_cart/src/blocs/cart/cart.bloc.dart' as _i6;
import 'package:shopping_cart/src/blocs/home/home.bloc.dart' as _i5;
import 'package:shopping_cart/src/extras/helpers/database.helper.dart' as _i3;
import 'package:shopping_cart/src/extras/navigators/app.router.dart' as _i4;
import 'package:shopping_cart/src/injections/register.module.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerAppModule = _$RegisterAppModule();
    gh.factory<_i3.DatabaseHelper>(() => _i3.DatabaseHelper());
    gh.lazySingleton<_i4.AppRouter>(() => registerAppModule.navigator);
    gh.factory<_i5.HomeBloc>(() => _i5.HomeBloc(gh<_i3.DatabaseHelper>()));
    gh.factory<_i6.CartBloc>(() => _i6.CartBloc(gh<_i3.DatabaseHelper>()));
    return this;
  }
}

class _$RegisterAppModule extends _i7.RegisterAppModule {}
