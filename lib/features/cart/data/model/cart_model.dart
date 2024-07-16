class CartModel {
  final int quantity;
  final String img;
  final num price;
  final String name;
  final String measure;

  const CartModel({
    required this.quantity,
    required this.img,
    required this.price,
    required this.name,
    required this.measure,
  });

  factory CartModel.fromJson(json) {
    return CartModel(
      quantity: json['quantity'] as int,
      img: json['img'] as String,
      price: json['price'] as num,
      name: json['name'] as String,
      measure: json['measure'] as String,
    );
  }
}
