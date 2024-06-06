// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shopping_cart/src/extras/models/product/product.view.model.dart';
import 'package:shopping_cart/src/widgets/common/button.close.dart';
import 'package:shopping_cart/src/widgets/common/quantity.selector.dart';

import '../common/image.card.dart';

class ProductCart extends StatefulWidget {
  ProductCart(
      {super.key,
      required this.product,
      required this.onUpdateQuantity,
      this.quantity = 1,
      required this.closePressed,
      required this.id});
  final ProductVieModel product;
  final int id;
  final Function(int id) closePressed;
  int quantity;
  final Function(int quantity) onUpdateQuantity;

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  // int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ImageCard(
            image: widget.product.image,
            height: 80,
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                QuantitySelector(
                  titleDialog: widget.product.name,
                  initialQuantity: widget.quantity,
                  onChanged: (int value) {
                    setState(() {
                      widget.quantity = value;
                      widget.onUpdateQuantity(value);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCloseButton(
                onPressed: () {
                  widget.closePressed(widget.id);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${widget.product.price} đ',
                style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
