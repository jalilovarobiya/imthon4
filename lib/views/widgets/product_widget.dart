import 'package:flutter/material.dart';
import 'package:imthon3/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rasm
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          // Nomi
          Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 16),
              Text(product.rating.toString()),
              SizedBox(width: 10),
              Icon(Icons.location_on, size: 16, color: Colors.grey),
              Text(product.distance),
            ],
          ),
          SizedBox(height: 4),
          // Narx
          Text(
            '\$${product.price}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
