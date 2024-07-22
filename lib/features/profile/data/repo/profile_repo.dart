import 'package:dartz/dartz.dart';
import 'package:fruit_hup/features/home/data/models/product_model.dart';

abstract class ProfileRepo {
  Future<void> logout();
  Future<void> changeUserName(String name);
  Future<void> changeUserPass(String pass);
  Stream<Either<List<ProductModel>, dynamic>> getFavProducts();
  Future<void> addProducToFav({required ProductModel product});
}
