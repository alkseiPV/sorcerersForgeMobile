import 'package:sourcerers_forge/data/dio_service.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/flushbar.dart';

class RegistrationUseCase {
  DioService dioService;

  RegistrationUseCase({required this.dioService});

  getCode(Map user) async {
    final resp = await dioService.postRequest(
      '/sign-up', // Указываем конечную точку API
      data: user, // Передаем данные пользователя в теле запроса
    );

    if (resp.statusCode! <= 300) {
      Flushbar.success(title: 'Код отправлен!').show();
    } else {
      Flushbar.error(title: 'Произошла ошибка, повторите позже!').show();
    }
  }

  registration(Map user) async {
    print(user);
    final resp = await dioService.postRequest(
      '/confirmCode', // Указываем конечную точку API
      data: user, // Передаем данные пользователя в теле запроса
    );
    return resp;
  }
}
