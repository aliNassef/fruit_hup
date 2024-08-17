import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../cache/cache_helper.dart';
import '../../../service_locator.dart';

part 'change_lang_state.dart';

class ChangeLangCubit extends Cubit<ChangeLangState> {
  ChangeLangCubit() : super(ChangeLangInitial());

  var currentLang = 'ar';

  void changeLangToEn() {
    currentLang = 'en';
    getIt<CacheHelper>().saveData(key: 'lang', value: 'en');
    emit(ChangeLangSuccessToEn());
  }

  void changeLangToAr() {
    currentLang = 'ar';
    getIt<CacheHelper>().saveData(key: 'lang', value: 'ar');
    emit(ChangeLangSuccessToAr());
  }
}
