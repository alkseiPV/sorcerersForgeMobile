import 'package:sourcerers_forge/data/secure_storage.dart';
import 'package:sourcerers_forge/domains/repositories/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  SecureStorage secureStorage;

  StorageRepositoryImpl({required this.secureStorage});

  @override
  Future<String?> readInfo(String key) async {
    String? answer = await secureStorage.readSecureData(key);
    return answer;
  }

  @override
  void writeInfo(String key, String value) async {
    await secureStorage.writeSecureData(key, value);
  }
}
