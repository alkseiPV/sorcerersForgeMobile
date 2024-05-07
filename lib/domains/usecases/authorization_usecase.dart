import 'package:sourcerers_forge/data/dio_service.dart';
import 'package:sourcerers_forge/data/secure_storage.dart';

class AuthorizationUseCase {
  DioService dioService;
  SecureStorage secureStorage;
  AuthorizationUseCase({required this.dioService, required this.secureStorage});

  logIn(Map user) async {
    final response = await dioService.postRequest('/sign-in', data: user);

    if (response.statusCode == 200) {
      secureStorage.writeSecureData('token', response.data["token"]);
    }
    return response;
  }

  logOut() async {
    secureStorage.writeSecureData('token', '');
  }

  register(Map<String, dynamic> userInfo) {}
}
