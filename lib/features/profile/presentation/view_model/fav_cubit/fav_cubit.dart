import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/home/data/models/product_model.dart';
import 'package:fruit_hup/features/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.profileRepo) : super(FavInitial());
  final ProfileRepo profileRepo;
  bool isFav = false;
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
    emit(ProductAdded());
  }

  changeFav(int index) {
    isFav = !isFav;
    emit(FavChanged());
  }
}
