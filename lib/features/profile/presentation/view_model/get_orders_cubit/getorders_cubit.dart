import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/profile/data/repo/profile_repo.dart';
import 'package:fruit_hup/features/profile/presentation/view_model/get_orders_cubit/getorders_state.dart';

class GetordersCubit extends Cubit<GetordersState> {
  GetordersCubit(this._profileRepo) : super(GetordersInitial());
  final ProfileRepo _profileRepo;

  Future<void> getOrders() async {
    emit(GetordersLoading());
    final result = await _profileRepo.getOrders();
    result.fold(
      (l) {
        emit(
          GetordersLoaded(orders: l),
        );
      },
      (r) => emit(
        GetordersFailure(errMessage: r),
      ),
    );
  }
}
