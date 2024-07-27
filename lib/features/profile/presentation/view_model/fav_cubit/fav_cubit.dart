import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/home/data/models/product_model.dart';
import 'package:fruit_hup/features/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.profileRepo) : super(FavInitial());
  final ProfileRepo profileRepo;
  // bool isFav = false;
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

  removeProductFromFavById({
    required int index,
  }) async {
    await profileRepo.removeProductFromFavById(index: index);
  }

  removeProductFromFav(
      {required int index, required List<ProductModel> products}) async {
    await profileRepo.removeProductFromFav(index: index, products: products);
  }

  changeFav(int index, List<ProductModel> product) async {
    if (favoriteProductId.contains(product[index].id)) {
      favoriteProductId.remove(product[index].id);
      removeProductFromFav(index: index, products: product);
    } else {
      await addProductToFav(product: product[index]);
      log("the id is " + product[index].id.toString());
      favoriteProductId.add(product[index].id);
    }
    emit(FavChanged());
  }
}
