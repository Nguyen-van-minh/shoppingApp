import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/src/blocs/base/base.page.state.dart';
import 'package:shopping_cart/src/blocs/home/home.bloc.dart';
import 'package:shopping_cart/src/blocs/home/home.event.dart';
import 'package:shopping_cart/src/blocs/home/home.state.dart';
import 'package:shopping_cart/src/widgets/common/topic.dart';
import 'package:shopping_cart/src/widgets/product/product.grid.dart';
import 'package:shopping_cart/src/widgets/product/product.list.dart';
import 'package:shopping_cart/src/extras/navigators/app.router.dart';
import '../../extras/navigators/configs/route.name.constants.dart';

@RoutePage(name: ROUTES.homeRoute)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends BasePageState<HomeScreen, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const InitData());
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: const HomeAppBar(),
      body: Center(
        child: NestedScrollView(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Topic(
                title: "HOT Products",
              ),
              BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      previous.products != current.products,
                  builder: (context, state) {
                    return SizedBox(
                        height: 220,
                        child: HorizontalProductList(
                          products: state.hotProducts,
                          addToCart: (int productId, int quantity) {
                            bloc.add(AddProductToCart(
                                productId: productId, quantity: quantity));
                            Navigator.of(context).pop();
                          },
                        ));
                  }),
              const Topic(
                title: "All Products",
              ),
              BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      previous.products != current.products,
                  builder: (context, state) {
                    return Expanded(
                        child: VerticalProductList(
                      products: state.products,
                      addToCart: (int productId, int quantity) {
                        bloc.add(AddProductToCart(
                            productId: productId, quantity: quantity));
                        Navigator.of(context).pop();
                      },
                    ));
                  }),
            ],
          ),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const HomeAppBar(),
            ];
          },
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text(
        'Home',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            context.router.push(const CartRoute());
          },
        ),
      ],
      automaticallyImplyLeading: false,
      centerTitle: true,
      floating: true,
      pinned: true,
    );
  }
}
// class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const HomeAppBar({super.key});

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: const Text(
//         'Home',
//         textAlign: TextAlign.center,
//       ),
//       actions: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.shopping_cart),
//           onPressed: () {
//             context.router.push(const CartRoute());
//           },
//         ),
//       ],
//       centerTitle: true,
//     );
//   }
// }
