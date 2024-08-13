import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../data/repo/home_repo.dart';

part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  GetAllProductCubit(this.homeRepo) : super(GetAllProductInitial());
  final HomeRepo homeRepo;
  getAllProducts() async {
    emit(GetAllProductLoading());
    var data = await homeRepo.getAllProducts();
    data.fold(
      (l) {
        AppConstants.products = l;
      //  debugPrint(AppConstants.products.length.toString());
        emit(GetAllProductLoaded());
      },
      (r) {
        emit(GetAllProductFailure(errMessage: r.errMessage));
      },
    );
  }
}
