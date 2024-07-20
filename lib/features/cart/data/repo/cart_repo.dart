import 'package:dartz/dartz.dart';
import '../model/cart_model.dart';

abstract class CartRepo {
  Future<void> addProductToCart({
    required int quantity,
    required String img,
    required num price,
    required String name,
    required String measure,
  });
  Stream<Either<List<CartModel>, dynamic>> getCartitems();
  Future<void> removeProductFromCart({required int index});
}
