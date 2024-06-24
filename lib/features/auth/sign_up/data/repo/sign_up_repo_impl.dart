import 'package:firebase_auth/firebase_auth.dart';

import 'sign_up_repo.dart';

class SignUpRepoImpl extends SignUpRepo {
  @override
  Future<void> signUpWithEmailAndPass(
      {required String email, required String pass}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
  }
}
