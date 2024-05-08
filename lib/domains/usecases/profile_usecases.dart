import 'package:sourcerers_forge/data/dio_service.dart';
import 'package:sourcerers_forge/data/secure_storage.dart';
import 'package:sourcerers_forge/models/order_model.dart';
import 'package:sourcerers_forge/models/profile_model.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/flushbar.dart';

class ProfileUseCases {
  DioService dioService;
  SecureStorage secureStorage;

  ProfileUseCases({required this.dioService, required this.secureStorage});

  Future<ProfileModel?> getProfile() async {
    final response = await dioService.getRequest('/profile/profile');
    ProfileModel? data = ProfileModel.fromJson(response.data['profile']);
    return data;
  }

  updateProfile(ProfileModel data) async {
    final response = await dioService.postRequest('/profile/updateProfile',
        data: data.toJson());
    if (response.statusCode! <= 300) {
      Flushbar.success(title: 'Данные сохранены!').show();
    } else {
      Flushbar.error(title: 'Произошла ошибка! Повторите позже').show();
    }
  }

  Future<String> getEmail() async {
    final response = await dioService.getRequest('/private/whoami');
    String? email = response.data['email'];
    return email ?? 'error';
  }

  sendCode(String? myemail) async {
    if (myemail == null) {
      myemail = await getEmail();
      if (myemail != 'error') {}
    }

    final response =
        await dioService.postRequest('/resetCode', data: {'email': myemail});
    if (response.statusCode == 200) {
      Flushbar.success(title: 'Код отправлен!').show();
    } else {
      Flushbar.error(title: 'Произошла ошибка! Повторите позже').show();
    }
  }

  resetPass(Map data, bool isProfile) async {
    if (isProfile) {
      String email = await getEmail();
      if (email != 'error') {
        data.addAll({'email': email});
      }
    }
    final response = await dioService.postRequest('/resetPassword', data: data);

    if (response.statusCode! <= 300) {
      Flushbar.success(title: 'Пароль изменен!').show();
    } else {
      Flushbar.error(title: 'Произошла ошибка! Повторите позже').show();
    }
  }

  getOrderHistory() async {
    List<OrderModel> orders = [];
    final response = await dioService.getRequest('/profile/orderHistory');
    if (response.data['orders'] != null) {
      print(response.data);
      orders = (response.data['orders'] as List)
          .map((e) => OrderModel.fromJson(e))
          .toList();
    }
    return orders;
  }

  sendComment(int stars, String comment, int id) async {
    final response = await dioService.postRequest('/createReview',
        data: {'product_id': id, 'stars': stars, 'message': comment});
    if (response.statusCode! <= 300) {
      Flushbar.success(title: 'Отзыв отправлен!').show();
      return true;
    } else {
      Flushbar.error(title: 'Произошла ошибка! Повторите позже').show();
      return false;
    }
  }

  sendRequestLearning(String message) async {
    final response =
        await dioService.postRequest('/learn', data: {'message': message});
    if (response.statusCode! <= 300) {
      Flushbar.success(title: 'Отзыв отправлен!').show();
      return true;
    } else {
      Flushbar.error(title: 'Произошла ошибка! Повторите позже').show();
      return false;
    }
  }
}
