import 'package:injectable/injectable.dart';
import 'package:shopping_cart/src/extras/navigators/app.router.dart';

@module
abstract class RegisterAppModule {
  @lazySingleton
  AppRouter get navigator => AppRouter();
}
