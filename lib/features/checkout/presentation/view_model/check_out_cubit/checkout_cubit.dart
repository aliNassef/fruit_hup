import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  int introPayMethod = 0;
  void changeIntroPayMethod(int index) {
    introPayMethod = index;
    emit(ChangeIntroPayMethod());
  }
}
