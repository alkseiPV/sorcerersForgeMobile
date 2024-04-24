import 'package:sourcerers_forge/data/dio_service.dart';
import 'package:sourcerers_forge/data/secure_storage.dart';

class ProfileUseCases {
  DioService dioService;
  SecureStorage secureStorage;

  ProfileUseCases({required this.dioService, required this.secureStorage});
}
