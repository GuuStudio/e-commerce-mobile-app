import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _productInCart = [];
  List<Product> get productInCart => _productInCart;

  void addToCart(Product product) {
    if(_productInCart.contains(product)) {
      int index =  _productInCart.indexOf(product);
      _productInCart[index].quantity++;
    } else {
      _productInCart.add(product);
    }
  }
  void increment(int index) {
    _productInCart[index].quantity++;
    notifyListeners();
  }
  void decrement(int index) {
    if ( _productInCart[index].quantity > 1) {
      _productInCart[index].quantity--;
      notifyListeners();
    }
  }
  void remove(int index) {
    _productInCart.removeAt(index);
    notifyListeners();
  }

  double priceTotal() {
    double total = 0.0;
    for (Product e in _productInCart) {
      total += e.price * e.quantity;
    }
    notifyListeners();
    return total;
  }
}