import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/home/data/models/offer_model.dart';
import 'package:fruit_hup/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_offers_state.dart';

class GetOffersCubit extends Cubit<GetOffersState> {
  GetOffersCubit(this.homeRepo) : super(GetOffersInitial());
  final HomeRepo homeRepo;
  getOffers() async {
    emit(GetOffersLoading());
    var data = await homeRepo.getOffers();
    data.fold(
      (l) => emit(GetOffersLoaded(instanceOfOfferModel: l)),
      (r) => emit(GetOffersFailure(
        errMessage: r.errMessage,
      )),
    );
  }
}
