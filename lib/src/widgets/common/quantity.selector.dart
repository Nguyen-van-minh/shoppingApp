// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shopping_cart/src/widgets/common/button.custom.dart';

class QuantitySelector extends StatefulWidget {
  final String? titleDialog;
  final int initialQuantity;
  final ValueChanged<int> onChanged;

  const QuantitySelector(
      {super.key,
      required this.initialQuantity,
      required this.onChanged,
      this.titleDialog});

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
    _controller = TextEditingController(text: _quantity.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      _controller.text = _quantity.toString();
      widget.onChanged(_quantity);
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
        _controller.text = _quantity.toString();
        widget.onChanged(_quantity);
      }
    });
  }

  void _showInputDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int newQuantity = _quantity;
        return AlertDialog(
          title: Center(child: Text(widget.titleDialog ?? "")),
          content: SizedBox(
            width: 80,
            child: TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.orange, // Màu cam
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.orange,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (value) {
                newQuantity = int.tryParse(value) ?? _quantity;
              },
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Submit",
                    onPressed: () {
                      setState(() {
                        _quantity = newQuantity;
                        widget.onChanged(_quantity);
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, color: Colors.black),
            onPressed: _decrementQuantity,
          ),
          Container(
            width: 1.0,
            height: 45.0,
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: _showInputDialog,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '$_quantity',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: 1.0,
            height: 45.0,
            color: Colors.grey,
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: _incrementQuantity,
          ),
        ],
      ),
    );
  }
}
