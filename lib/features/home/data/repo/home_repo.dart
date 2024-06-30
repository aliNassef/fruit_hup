import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/offer_model.dart';
import '../models/product_model.dart';

abstract class HomeRepo {
  Future<Either<List<ProductModel>, Failure>> getAllProducts();
  Future<Either<OfferModel, Failure>> getOffers();
}
