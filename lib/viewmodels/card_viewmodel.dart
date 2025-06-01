import 'package:flutter/foundation.dart';

import '../models/product_model.dart';

class CartViewmodel extends ChangeNotifier {
  final List<ProductModel> cartProducts = [];

  double getTotal() {
    return cartProducts.fold(0, (umumiySumma, hozirgiMahsulot) {
      return umumiySumma + hozirgiMahsulot.price;
    });
  }

  bool isInCart(int id) {
    return cartProducts.any((product) => product.id == id);
  }

  void addToCart(ProductModel product) {
    cartProducts.add(product);
    notifyListeners();
  }

  void removeFromCart(int id) {
    cartProducts.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  void order() {
    // cartProducts.removeWhere((product) => product.id == id);
    cartProducts.clear();
    notifyListeners();
  }
}
