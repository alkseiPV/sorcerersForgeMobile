import 'package:flutter/material.dart';

class AuthorizationProvider extends ChangeNotifier {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController regLoginController = TextEditingController();
  TextEditingController regPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  clearRegData() {
    regLoginController.clear();
    regPasswordController.clear();
    confirmPasswordController.clear();
  }

  clearLoginData() {
    loginController.clear();
    passwordController.clear();
  }
}
