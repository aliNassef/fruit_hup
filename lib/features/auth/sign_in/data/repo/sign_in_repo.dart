import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInRepo {
  Future<UserCredential> signInWithGoogle();
  Future<void> signInWithEmailAndPass(
      {required String email, required String pass});
}
