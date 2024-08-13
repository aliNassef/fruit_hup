import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/cache/cache_helper.dart';
import '../../../../../../core/service_locator.dart';
import '../../../data/repo/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpRepo) : super(SignUpInitial());

  final SignUpRepo _signUpRepo;
  // validate input
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // checkBox State
  bool checkedBox = false;
  bool isSecurePass = true;

  // sign up parametes
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  signUpWithEmailAndPass() async {
    emit(SignUpLoading());
    try {
      await _signUpRepo.signUpWithEmailAndPass(
          email: email.text, pass: pass.text);
      getIt
          .get<CacheHelper>()
          .saveData(key: AppConstants.username, value: name.text);
      getIt
          .get<CacheHelper>()
          .saveData(key: AppConstants.useremail, value: email.text);

      getIt.get<CacheHelper>().setSecureData(AppConstants.userPass, pass.text);
      emit(SignUpLoaded());
    } catch (e) {
      emit(
        SignUpFailure(errMessage: e.toString()),
      );
    }
  }

  changeSecurepass() {
    isSecurePass = !isSecurePass;
    emit(SignUpChangeSecurePass());
  }

  changeCheckBoxState() {
    emit(SignUpInitial());
    checkedBox = !checkedBox;
    emit(SignUpDone());
  }
}
