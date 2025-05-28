import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductViewModel {
  Future<List<ProductModel>> getProducts() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    return snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data()))
        .toList();
  }
}
