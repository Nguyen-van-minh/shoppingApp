import 'package:flutter/material.dart';
import 'package:shopping_cart/src/extras/helpers/database.helper.dart';
import 'package:shopping_cart/src/extras/navigators/app.router.dart';
import 'package:shopping_cart/src/injections/injection.register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper dbHelper = DatabaseHelper();
  await dbHelper.initDatabase();
  // await dbHelper.deleteAllProducts();
  final appRouter = AppRouter();
  configureInjection();
  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}
