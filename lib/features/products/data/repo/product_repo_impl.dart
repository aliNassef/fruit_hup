import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/api/api_services.dart';
import '../../../../core/error/failure.dart';
import '../../../home/data/models/product_model.dart';
import 'product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final ApiServices api;

  ProductRepoImpl({required this.api});
  @override
  Future<Either<List<ProductModel>, Failure>> fetchProdducts(
      {num startPrice = 0, num endPrice = 1000}) async {
    try {
      CollectionReference response =
          await api.getProductCollection() as CollectionReference;
      var data = await response
          .where('price', isLessThan: endPrice)
          .where('price', isGreaterThan: startPrice)
          .orderBy(
            'price',
            descending: true,
          )
          .get();

      List<ProductModel> products = [];
      for (var item in data.docs) {
        log(item.data().toString());
        products.add(ProductModel.fromJson(item.data()));
      }
      return Left(products);
    } catch (e) {
      return Right(Failure(errMessage: e.toString()));
    }
  }
}
