abstract class ProfileRepo {
  Future<void> logout();
  Future<void> changeUserName(String name);
  Future<void> changeUserPass(String pass);
}
