abstract class DAO<T> {
  Future create(T value);
  Future<T> findOne(int id);
  Future<List<T>> findAll();
  Future update(T value);
  Future delete(int id);
}
