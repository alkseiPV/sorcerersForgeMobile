import 'package:flutter/material.dart';
import 'package:sourcerers_forge/models/product_model.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  List<ProductModel> _allProducts = [];
  List<ProductModel> get allProducts => _allProducts;
  set allProducts(List<ProductModel> val) {
    _allProducts = val;
    notifyListeners();
  }

  updateProduct(ProductModel productModel) {
    allProducts.firstWhere((element) => element.id == productModel.id);
    for (int i = 0; i < allProducts.length; i++) {
      if (productModel.id == allProducts[i].id) {
        allProducts[i] = allProducts[i].copyWith(
            isCart: productModel.isCart, isFavorite: productModel.isFavorite);
        break;
      }
    }

    notifyListeners();
  }

  getActualList(List<ProductModel> products) {
    List<ProductModel> actualProducts = [];
    for (var a in products) {
      for (var b in allProducts) {
        if (b.id == a.id) {
          actualProducts.add(b);
          break;
        }
      }
    }

    return actualProducts;
  }
}
