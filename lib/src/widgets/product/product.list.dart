import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_cart/src/extras/models/product/product.view.model.dart';
import 'package:shopping_cart/src/widgets/common/bottom.sheet.common.dart';
import 'package:shopping_cart/src/widgets/product/popup.cart.dart';
import 'package:shopping_cart/src/widgets/product/product.card.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList(
      {super.key, required this.products, required this.addToCart});
  final List<ProductVieModel> products;
  final Function(int productId, int quantity) addToCart;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
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
                    addToCart: (quantity) =>
                        {addToCart(products[index].id!, quantity)},
                  ));
            },
          );
        },
      ),
    );
  }
}
