import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/error/failure.dart';
import 'package:fruit_hup/features/home/data/models/product_model.dart';

abstract class ProductRepo {
  Future<Either<List<ProductModel>, Failure>> fetchProdducts(
      {num startPrice = 0, num endPrice = 300});
}
