// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/extras/helpers/database.helper.dart';
import 'package:shopping_cart/src/extras/navigators/app.router.dart';
import 'dart:async';

import '../../extras/navigators/configs/route.name.constants.dart';

@RoutePage(name: ROUTES.splashRoute)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      context.router.push(const HomeRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Center(
              child: Image.asset(
                'assets/cart.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Text(
              '© ${DateTime.now().year}, QSoft. All rights reserved',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
