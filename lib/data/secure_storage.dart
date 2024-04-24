import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  // Метод для записи данных
  Future<void> writeSecureData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Метод для чтения данных
  Future<String?> readSecureData(String key) async {
    return await _storage.read(key: key);
  }
}
