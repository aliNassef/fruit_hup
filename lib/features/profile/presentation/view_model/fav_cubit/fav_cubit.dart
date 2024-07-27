import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/home/data/models/product_model.dart';
import 'package:fruit_hup/features/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.profileRepo) : super(FavInitial());
  final ProfileRepo profileRepo;
  bool isFav = false;
  Set<int> favoriteProductId = {};
  getFavProducts() {
    emit(FavLoading());
    profileRepo.getFavProducts().listen((event) {
      event.fold(
        (l) => emit(FavLoaded(products: l)),
        (r) => emit(FavFailure(errMessage: r.errMessage)),
      );
    });
  }

  addProductToFav({required ProductModel product}) async {
    await profileRepo.addProducToFav(product: product);
  }

  changeFav(int index, ProductModel product) async {
    isFav = !isFav;

    await addProductToFav(product: product);
    log("the id is " + product.id.toString());
    favoriteProductId.add(product.id);
    emit(FavChanged(index: index));
  }
}
