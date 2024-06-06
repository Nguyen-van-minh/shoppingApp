import 'package:flutter/material.dart';
import 'package:shopping_cart/src/extras/models/product/product.view.model.dart';
import 'package:shopping_cart/src/widgets/common/bottom.sheet.common.dart';
import 'package:shopping_cart/src/widgets/product/popup.cart.dart';
import 'package:shopping_cart/src/widgets/product/product.card.dart';

class VerticalProductList extends StatelessWidget {
  const VerticalProductList(
      {super.key, required this.products, required this.addToCart});
  final List<ProductVieModel> products;
  final Function(int productId, int quantity) addToCart;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: (products.length / 2).ceil(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 25,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            image: products[index].image,
            name: products[index].name,
            price: products[index].price,
            onAddToCart: () {
              BottomSheetCommon.show(
                  context: context,
                  height: 200,
                  content: PopupAddToCart(
                    product: products[index],
                    addToCart: (int quantity) =>
                        {addToCart(products[index].id!, quantity)},
                  ));
            },
          );
        },
      ),
    );
  }
}
