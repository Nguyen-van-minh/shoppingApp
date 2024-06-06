import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/src/blocs/base/base.page.state.dart';
import 'package:shopping_cart/src/blocs/cart/cart.bloc.dart';
import 'package:shopping_cart/src/blocs/cart/cart.event.dart';
import 'package:shopping_cart/src/blocs/cart/cart.state.dart';
import 'package:shopping_cart/src/extras/models/cart/cart.view.model.dart';
import 'package:shopping_cart/src/extras/navigators/app.router.dart';
import 'package:shopping_cart/src/widgets/common/button.custom.dart';
import 'package:shopping_cart/src/widgets/product/product.cart.dart';
import '../../extras/navigators/configs/route.name.constants.dart';
import 'package:shopping_cart/src/extras/navigators/app.router.dart';

@RoutePage(name: ROUTES.cartRoute)
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends BasePageState<CartScreen, CartBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const InitData());
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CartAppBar(),
        body: Stack(children: [
          Center(
            child: BlocBuilder<CartBloc, CartState>(
                buildWhen: (previous, current) =>
                    previous.carts != current.carts,
                builder: (context, state) {
                  return ListView.builder(
                      padding: const EdgeInsets.all(18),
                      itemCount: state.carts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCart(
                          id: state.carts[index].id,
                          product: state.carts[index].product!,
                          onUpdateQuantity: (int quantity) {},
                          quantity: state.carts[index].quantity,
                          closePressed: (int id) {
                            bloc.add(RemoveProductToCart(cartId: id));
                            // bloc.add(const InitData());
                          },
                        );
                      });
                }),
          ),
          Positioned(
              bottom: 16,
              left: 18,
              right: 18,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total price:",
                        style: TextStyle(fontSize: 25),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                          buildWhen: (previous, current) =>
                              previous.carts != current.carts,
                          builder: (context, state) {
                            return Text(getTotalPrice(state.carts).toString(),
                                style: const TextStyle(fontSize: 25));
                          })
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          bloc.add(const RemoveAllCart());
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Order Successfully'),
                                actions: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: CustomButton(
                                                text: "Back to Home",
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  context.router.replaceAll(
                                                      [const HomeRoute()]);
                                                }))
                                      ],
                                    ),
                                    // ElevatedButton(
                                    //   onPressed: () {
                                    //     Navigator.pop(context);
                                    //     context.router
                                    //         .replaceAll([const HomeRoute()]);
                                    //   },
                                    //   child:
                                    // ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Đặt border radius 10px
                          ),
                        ),
                        child: const Text(
                          'Order',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      )),
                ],
              )),
        ]));
  }
}

double getTotalPrice(List<CartViewModel> carts) {
  double totalPrice = 0;
  for (var item in carts) {
    totalPrice += item.getTotalPrice();
  }
  return totalPrice;
}

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      title: BlocBuilder<CartBloc, CartState>(
          buildWhen: (previous, current) => previous.carts != current.carts,
          builder: (context, state) {
            return Text(
              'Cart (${state.carts.length})',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            );
          }),
      centerTitle: true,
    );
  }
}
