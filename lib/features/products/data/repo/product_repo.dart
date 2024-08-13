import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../home/data/models/product_model.dart';

abstract class ProductRepo {
  Future<Either<List<ProductModel>, Failure>> fetchProdducts(
      {num startPrice = 0, num endPrice = 1000 , required String sortBy , required bool asc});
}
