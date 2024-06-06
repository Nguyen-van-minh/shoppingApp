import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/screens/home/home.screen.dart';
import 'package:shopping_cart/src/screens/cart/cart.screen.dart';
import 'package:shopping_cart/src/screens/splash/splash.screen.dart';

part 'app.router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<CustomRoute> get routes => [
        CustomRoute(
          page: SplashRoute.page,
          initial: true,
          path: '/',
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
        CustomRoute(
          page: HomeRoute.page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
        CustomRoute(
          page: CartRoute.page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      ];
}
