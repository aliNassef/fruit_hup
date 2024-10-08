import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../data/repo/sign_in_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInRepo) : super(SignInInitial());
  final SignInRepo _signInRepo;
  // validator key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // sign with email and password
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isSecurePass = true;

  void changeIsSecurePass() {
    isSecurePass = !isSecurePass;
    emit(SignInInitial());
  }

  signInWithEmailAndPassword(
      {required String email, required String pass}) async {
    emit(SignInLoading());

    try {
      await _signInRepo.signInWithEmailAndPass(email: email, pass: pass);
      emit(SignInLoaded());
    } catch (msg) {
      emit(
        SignInFailure(
          errMessage: msg.toString(),
        ),
      );
    }
  }

  // sign with google
  signInWithGoogle() async {
    emit(SignInLoading());

    try {
      await _signInRepo.signInWithGoogle();
      emit(SignInLoaded());
    } catch (e) {
      emit(
        SignInFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
