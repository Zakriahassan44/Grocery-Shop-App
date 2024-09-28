import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final _shopItems = [
    ["avacado", "4.00", "images/avacado.png", Colors.green],
    ["Banana", "2.50", "images/banana.png", Colors.yellow],
    ["chicken", "4.00", "images/chiken.png", Colors.brown],
    ["drinking", "4.00", "images/drinking.png", Colors.blue],
  ];

  // List of cart item

  List _cartItems = [];
  get shopItems => _shopItems;
  get cartItems => _cartItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from item
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
