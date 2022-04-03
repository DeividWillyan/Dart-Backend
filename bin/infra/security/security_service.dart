abstract class SecurityService<T> {
  Future<String> generateJWT(String userID);
  Future<T?> validateJWT(String token);
}
