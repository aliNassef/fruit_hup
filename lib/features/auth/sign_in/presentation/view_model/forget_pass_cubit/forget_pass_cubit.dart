import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit() : super(ForgetPassInitial());
  TextEditingController emailController = TextEditingController();

  forgetPass() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text)
          .then((event) {
        emit(ForgetPassLoaded());
      }).onError((error, stackTrace) {
        emit(ForgetPassFailure(errMessage: error.toString()));
      });
    } catch (e) {
      emit(ForgetPassFailure(errMessage: e.toString()));
    }
  }
}
