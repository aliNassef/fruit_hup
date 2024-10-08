import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../data/repo/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;
  TextEditingController startPrice = TextEditingController();
  TextEditingController endPrice = TextEditingController();
  int bottomSheetIndex = 0;
  bool checkBoxAsc = false;
  bool checkBoxDesc = false;
  bool checkBoxAlaph = false;

  CollectionReference products =
      FirebaseFirestore.instance.collection(AppConstants.productCollection);
  changeBottomSheetPage() {
    emit(bottomSheetFilter());
  }

  // changeCheckBoxValue(bool checkBoxValue) {
  //   checkBoxValue = !checkBoxValue;
  //   emit(chooseSortByDone());
  // }

  void changeCheckBoxValue(int index) {
    checkBoxAsc = index == 0;
    checkBoxDesc = index == 1;
    checkBoxAlaph = index == 2;
    emit(chooseSortByDone());
  }

  getIntialBottomSheetState() {
    emit(bottomSheetIntial());
  }

  fetchProducts({required String sortBy, required bool asc}) async {
    emit(ProductLoading());
    var data = await productRepo.fetchProdducts(
        sortBy: sortBy,
        asc: asc,
        startPrice: startPrice.text.isEmpty ? 0 : double.parse(startPrice.text),
        endPrice: endPrice.text.isEmpty ? 1000 : double.parse(endPrice.text));
    data.fold(
      (l) {
        debugPrint(l[0].name);
        emit(ProductLoaded(products: l));
      },
      (r) {
        emit(ProductFailure(errMessage: r.errMessage));
      },
    );
  }
}
