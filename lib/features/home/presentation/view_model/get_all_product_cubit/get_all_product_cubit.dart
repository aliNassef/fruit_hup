import 'package:bloc/bloc.dart';
import 'package:fruit_hup/core/api/api_services.dart';
import 'package:meta/meta.dart';

part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  GetAllProductCubit(this.api) : super(GetAllProductInitial());
  final ApiServices api;
  getAllProducts() async {
    emit(GetAllProductLoading());
    try {
      api.getData();
      emit(GetAllProductLoaded());
    } catch (e) {
      emit(GetAllProductFailure(
        errMessage: e.toString(),
      ));
    }
  }
}
