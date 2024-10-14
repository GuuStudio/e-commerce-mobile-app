import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _favoriteProducts = [];
  List<Product> get favoriteProducts => _favoriteProducts;

  void toggleFavorite(Product product) {
    if(_favoriteProducts.contains(product)) {
      _favoriteProducts.remove(product);
    } else {
      _favoriteProducts.add(product);
    }
    notifyListeners();
  }

  bool hasFavorite (Product product) {
    return _favoriteProducts.contains(product);
  }
}