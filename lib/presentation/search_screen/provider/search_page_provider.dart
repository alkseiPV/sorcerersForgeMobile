import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sourcerers_forge/locator.dart';
import 'package:sourcerers_forge/models/product_model.dart';
import 'package:sourcerers_forge/presentation/home_screen/provider/home_provider.dart';

class SearchPageProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  List<ProductModel> allproducts =
      List.from(locator<HomeProvider>().allProducts);

  List<ProductModel> filteredProducts = [];

  filterFunc(String? val) {
    filteredProducts = [];
    allproducts.forEach((element) {
      if (element.description!.toLowerCase().contains(val!.toLowerCase()) ||
          element.name!.toLowerCase().contains(val.toLowerCase())) {
        filteredProducts.add(element);
      }
    });
    if (val!.isEmpty) {
      filteredProducts = [];
    }

    notifyListeners();
  }
}
