abstract class SignUpRepo {
  Future<void> signUpWithEmailAndPass(
      {required String email, required String pass});
}
