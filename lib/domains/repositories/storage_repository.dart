abstract class StorageRepository {
  Future<String?> readInfo(String key);
  void writeInfo(String key, String value);
}
