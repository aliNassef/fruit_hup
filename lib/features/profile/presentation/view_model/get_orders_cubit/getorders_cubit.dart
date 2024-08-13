import 'package:bloc/bloc.dart';
import '../../../data/repo/profile_repo.dart';
import 'getorders_state.dart';

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
