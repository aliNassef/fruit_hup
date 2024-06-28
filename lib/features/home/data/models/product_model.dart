class ProductModel {
  final String img;
  final String name;
  final int count;
  final double price;
  final String measure;

  const ProductModel({
    required this.img,
    required this.name,
    required this.count,
    required this.price,
    required this.measure,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      img: json['img'] as String,
      name: json['name'] as String,
      count: json['count'] as int,
      price: json['price'] as double,
      measure: json['measure'] as String,
    );
  }
}
