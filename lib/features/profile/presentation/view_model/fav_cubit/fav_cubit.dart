import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  bool isFav = false;
  addToFav() async {}
}
