import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class SearchRepo {
  Future addQueryToCollection({required String text});
  Future<Either<List<String>, Failure>> getQuries();
  deleteSpecificQuery({required int index});
  deleteAllQueries();
}
