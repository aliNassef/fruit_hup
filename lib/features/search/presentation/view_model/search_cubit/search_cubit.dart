import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  TextEditingController search = TextEditingController();
  final SearchRepo searchRepo;

  getQueries() async {
    emit(SearchLoading());
    var data = await searchRepo.getQuries();
    data.fold(
      (l) => emit(SearchLoaded(searchList: l)),
      (r) => emit(SearchFailure(errMessage: r.errMessage)),
    );
  }

  addQuery({required String val}) async {
    await searchRepo.addQueryToCollection(text: val);
  }

  deleteAllQueries() async {
    await searchRepo.deleteAllQueries();
    emit(SearchDeleteAllQueries());
  }

  deleteSpecificQuery({required int index}) async {
    await searchRepo.deleteSpecificQuery(index: index);
    await getQueries();
  }
}
