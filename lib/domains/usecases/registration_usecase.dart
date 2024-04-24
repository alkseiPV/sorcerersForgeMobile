import 'package:sourcerers_forge/data/dio_service.dart';

class RegistrationUseCase {
  DioService dioService;

  RegistrationUseCase({required this.dioService});

  registration(Map user) async {
    print(user);
    final resp = await dioService.postRequest(
      '/sign-up', // Указываем конечную точку API
      data: user, // Передаем данные пользователя в теле запроса
    );
    return resp;
  }
}
