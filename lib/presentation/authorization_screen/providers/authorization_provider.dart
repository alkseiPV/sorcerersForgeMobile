import 'package:flutter/material.dart';

class AuthorizationProvider extends ChangeNotifier {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController regLoginController = TextEditingController();
  TextEditingController regPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController confirmRegCodeController = TextEditingController();

  TextEditingController resetPassConfirmCodeController =
      TextEditingController();

  TextEditingController resetpassEmailController = TextEditingController();
  TextEditingController resetPassnewPassController = TextEditingController();
  clearRegData() {
    regLoginController.clear();
    regPasswordController.clear();
    confirmPasswordController.clear();
  }

  clearLoginData() {
    loginController.clear();
    passwordController.clear();
  }

  /// Валидатор электронной почты
  String? validateEmail(String? value, bool isloadingLogic, String? error) {
    if (isloadingLogic) {
      return error;
    } else {
      final emailPattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
      final emailRegExp = RegExp(emailPattern);

      if (value == null || value.isEmpty) {
        return 'Введите почту!';
      } else if (!emailRegExp.hasMatch(value)) {
        return 'Неверный формат почты!';
      }
      return null;
    }
  }

  /// Валидатор пароля
  String? validatePassword(String? value, bool isloadingLogic, String? error) {
    if (isloadingLogic) {
      return error;
    } else {
      const passwordPattern = r'^(?!^(.)\1+$)[A-Za-z\d@$!%*?&]{6,}$';
      final passwordRegExp = RegExp(passwordPattern);

      if (value == null || value.isEmpty) {
        return 'Введите пароль!';
      } else if (!passwordRegExp.hasMatch(value)) {
        return 'Пароль должен содержать не менее 6 символов\nи не должен состоять из повторяющихся символов.';
      }
      return null;
    }
  }
}
