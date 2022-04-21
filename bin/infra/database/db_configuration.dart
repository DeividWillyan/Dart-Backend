abstract class DBConfiguration {
  Future<dynamic> createConnection();

  Future<dynamic> get connection;
}
