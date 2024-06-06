// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shopping_cart/src/extras/models/product/product.view.model.dart';
import 'package:shopping_cart/src/widgets/common/button.custom.dart';
import 'package:shopping_cart/src/widgets/product/product.cart.dart';

class PopupAddToCart extends StatefulWidget {
  final ProductVieModel product;
  final Function(int quantity) addToCart;
  const PopupAddToCart(
      {Key? key, required this.product, required this.addToCart})
      : super(key: key);

  @override
  _PopupAddToCartState createState() => _PopupAddToCartState();
}

class _PopupAddToCartState extends State<PopupAddToCart> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductCart(
              id: widget.product.id ?? 0,
              product: widget.product,
              onUpdateQuantity: (value) {
                setState(() {
                  quantity = value;
                });
                print(value);
              },
              closePressed: (int id) {
                Navigator.of(context).pop();
              },
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Add to cart',
                    onPressed: () => {widget.addToCart(quantity)},
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
