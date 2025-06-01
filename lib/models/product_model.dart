class ProductModel {
  int id;
  final String name;
  final double rating;
  final String distance;
  final int price;
  final String image;

  ProductModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.distance,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json['name'],
      rating: (json['rating'] as num).toDouble(),
      distance: json['distance'],
      price: json['price'],
      image: json['image'],
    );
  }
}
