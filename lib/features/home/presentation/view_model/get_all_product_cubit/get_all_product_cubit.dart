import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  GetAllProductCubit() : super(GetAllProductInitial());
}
