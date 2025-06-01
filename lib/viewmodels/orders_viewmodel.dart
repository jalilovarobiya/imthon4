import 'package:flutter/material.dart';
import 'package:imthon3/models/product_model.dart';

class OrdersVievmodel extends ChangeNotifier {
  final List<ProductModel> orderProducts = [];

  void addToOrder(List<ProductModel> product) {
    orderProducts.addAll(product);
    notifyListeners();
  }
}
