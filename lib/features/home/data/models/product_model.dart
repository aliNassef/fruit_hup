class ProductModel {
  final String image;
  final String name;
  final int count;
  final num price;
  final String measure;

  const ProductModel({
    required this.image,
    required this.name,
    required this.count,
    required this.price,
    required this.measure,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      image: json['image'] as String,
      name: json['name'] as String,
      count: json['count'] as int,
      price: json['price'] as num,
      measure: json['measure'] as String,
    );
  }
}
