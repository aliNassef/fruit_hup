abstract class ProfileRepo {
  Future<void> logout();
  Future<void> changeUserName(String name);
}
