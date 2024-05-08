import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sourcerers_forge/locator.dart';
import 'package:sourcerers_forge/models/product_model.dart';
import 'package:sourcerers_forge/models/profile_model.dart';
import 'package:sourcerers_forge/presentation/home_screen/provider/home_provider.dart';

class ProfileProvider extends ChangeNotifier {
  TextEditingController newPassController = TextEditingController();
  TextEditingController smsController = TextEditingController();

  TextEditingController descriptionPersonalOrder = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController patronymicController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  bool _phoneEnable = false;
  bool get phoneEnable => _phoneEnable;
  set phoneEnable(bool val) {
    _phoneEnable = val;
    notifyListeners();
  }

  updateData(ProfileModel model) {
    contactController.text = model.contact ?? '';
    nameController.text = model.name ?? '';
    lastnameController.text = model.surname ?? '';
    patronymicController.text = model.patronymic ?? '';
    print('AAAAA ${contactController.text}');
    notifyListeners();
  }

  clearpersonalOrder() {
    phoneEnable = false;
    descriptionPersonalOrder.clear();
  }

  returbImginOrder(List<int> ids) {
    List<ProductModel> allProducts = locator<HomeProvider>().allProducts;
    List<String> urls = [];
    for (var element in ids) {
      for (var productElement in allProducts) {
        if (element == productElement.id) {
          urls.add(productElement.photo!);
          break;
        }
      }
    }
    return urls;
  }

  returnModels(List<int> ids) {
    List<ProductModel> allProducts = locator<HomeProvider>().allProducts;
    List<ProductModel> models = [];
    for (var element in ids) {
      for (var productElement in allProducts) {
        if (element == productElement.id) {
          models.add(productElement);
          break;
        }
      }
    }
    return models;
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  String? validateFIO(String? value, bool isname) {
    const namePattern = r'^[a-zA-Z\-]{2,}$';
    final nameRegExp = RegExp(namePattern);

    if ((value == null || value.isEmpty) && isname) {
      return 'Значение не может быть пустым!';
    } else if (value == null || value.isEmpty) {
      return null;
    } else if (!nameRegExp.hasMatch(value)) {
      return 'спецсимволы и цифры запрещены!';
    }
    return null;
  }

  /// Валидатор для телефонного номера
  String? validatePhoneNumber(String? value) {
    // Очищаем номер от маски
    final unmaskedValue =
        value!.replaceAll(RegExp(r'[^\d]'), '').replaceFirst('7', '');
    print(unmaskedValue);
    if (unmaskedValue.length != 10) {
      return 'Введите корректный номер телефона!';
    }
    return null;
  }
}
