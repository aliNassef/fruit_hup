import 'package:dartz/dartz.dart';
 import 'package:fruit_hup/features/cart/data/model/cart_model.dart';

abstract class CartRepo {
  Future<void> addProductToCart({
    required int quantity,
    required String img,
    required num price,
    required String name,
    required String measure,
  });

  Stream<Either<List<CartModel>, dynamic>> getCartitems();
  removeProductFromCart({required  int index});
}
