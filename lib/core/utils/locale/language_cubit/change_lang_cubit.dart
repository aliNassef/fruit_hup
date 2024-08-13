import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_lang_state.dart';

class ChangeLangCubit extends Cubit<ChangeLangState> {
  ChangeLangCubit() : super(ChangeLangInitial());

  var currentLang = 'ar';
  void changeLangToEn() {
    currentLang = 'en';
    emit(ChangeLangSuccessToEn());
  }

  void changeLangToAr() {
    currentLang = 'ar';
    emit(ChangeLangSuccessToAr());
  }
}
