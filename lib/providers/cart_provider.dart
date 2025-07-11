import 'package:flutter/material.dart';

import '../screens/ecomshop/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get cartItems {
    return {..._cartItems};
  }

  int get itemCount {
    return _cartItems.length;
  }

  void reduceItem(
    String productId,
    String productName,
    int quantity,
    double price,
  ) {
    if (quantity == 1) {
      _cartItems.remove(productId);
      notifyListeners();
    } else {
      _cartItems.update(
        productId,
        (cartItem) => CartModel(productId, productName, cartItem.quantity - 1,
            cartItem.price, cartItem.imageName),
      );

      notifyListeners();
    }
  }

  void addItem(String productId, String productName, double price) {
    if (_cartItems.containsKey(productId)) {
      //add quantity
      _cartItems.update(productId, (existingCartItem) {
        return CartModel(
            existingCartItem.id,
            existingCartItem.productName,
            existingCartItem.quantity + 1,
            existingCartItem.price,
            existingCartItem.imageName);
      });
    }
    notifyListeners();
  }

  void addToCart(String productId, String productName, int quantity,
      double price, String imageName) {
    _cartItems.putIfAbsent(
      productId,
      () => CartModel(productId, productName, 1, price, imageName),
    );
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.00;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  String get allBookIds {
    String  bookIds = '';
    if(_cartItems.length>1) {
      _cartItems.forEach((key, cartItem) {
        bookIds = "$bookIds${cartItem.id}|";
      });
    }else{
      _cartItems.forEach((key, cartItem) {
        bookIds =  cartItem.id;
      });
    }


    return bookIds;
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }
}
