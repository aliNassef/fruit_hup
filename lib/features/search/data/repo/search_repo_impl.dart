import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:fruit_hup/core/api/api_services.dart';
import 'package:fruit_hup/core/error/failure.dart';

import 'search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiServices api;

  SearchRepoImpl({required this.api});
  @override
  Future addQueryToCollection({required String text}) async {
    try {
      await api.addQuery(val: text);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<Either<List<String>, Failure>> getQuries() async {
    try {
      List<String> searchList = [];
      var data = await api.getQuries();
      for (var item in data) {
        searchList.add(item['search']);
      }
      return Left(searchList);
    } catch (e) {
      return Right(Failure(errMessage: e.toString()));
    }
  }

  @override
  deleteSpecificQuery({required String docId}) async {
    try {
      await api.deleteQuery(docId);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  deleteAllQueries() async {
    try {
      await api.deleteAllquries();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
