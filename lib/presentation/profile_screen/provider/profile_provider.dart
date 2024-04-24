import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  TextEditingController newPassController = TextEditingController();
  TextEditingController smsController = TextEditingController();

  TextEditingController descriptionPersonalOrder = TextEditingController();

  bool _phoneEnable = false;
  bool get phoneEnable => _phoneEnable;
  set phoneEnable(bool val) {
    _phoneEnable = val;
    notifyListeners();
  }

  clearpersonalOrder() {
    phoneEnable = false;
    descriptionPersonalOrder.clear();
  }
}
