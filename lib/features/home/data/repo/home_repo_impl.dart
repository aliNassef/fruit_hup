import 'package:dartz/dartz.dart';
import '../../../../core/api/api_services.dart';
import '../../../../core/error/failure.dart';
import '../models/offer_model.dart';

import '../models/product_model.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices api;

  HomeRepoImpl({required this.api});

  @override
  Future<Either<List<ProductModel>, Failure>> getAllProducts() async {
    try {
      var data = await api.getProductsData();
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return Left(products);
    } catch (e) {
      return Right(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<OfferModel, Failure>> getOffers() async {
    try {
      var data = await api.getOffers();

      return Left(OfferModel.fromJson(data[0]));
    } catch (e) {
      print('bad stateeeeeeeee');
      return Right(Failure(errMessage: e.toString()));
    }
  }
}
