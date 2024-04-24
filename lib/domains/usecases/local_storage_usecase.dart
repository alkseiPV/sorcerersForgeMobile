import 'package:sourcerers_forge/domains/repositories/storage_repository.dart';

class LocalStorageUseCase {
  StorageRepository storageRepository;
  LocalStorageUseCase({required this.storageRepository});

  Future<String?> getValue(String key) async {
    return storageRepository.readInfo(key);
  }

  Future<void> setValue(String key, String value) async {
    storageRepository.writeInfo(key, value);
  }
}
