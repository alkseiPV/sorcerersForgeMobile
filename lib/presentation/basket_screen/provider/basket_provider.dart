import 'package:flutter/material.dart';
import 'package:sourcerers_forge/models/cart_product_model.dart';

class BasketProvider extends ChangeNotifier {
  List<CartProductModel> _products = [];
  List<CartProductModel> get products => _products;
  set products(List<CartProductModel> val) {
    _products = val;

    notifyListeners();
    loadData();
  }

  int totalCount = 0;

  double totalPrice = 0;

  updateCount(bool add, int id) {
    if (add) {
      for (int i = 0; i < products.length; i++) {
        if (products[i].id == id) {
          products[i] = products[i].copyWith(count: products[i].count + 1);
          break;
        }
      }
    } else {
      for (int i = 0; i < products.length; i++) {
        if (products[i].id == id) {
          products[i] = products[i].copyWith(
              count: products[i].count == 1 ? 1 : products[i].count - 1);
          break;
        }
      }
    }
    loadData();
    notifyListeners();
  }

  deleteProduct(int id) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].id == id) {
        products.remove(products[i]);
        break;
      }
    }
    loadData();
    notifyListeners();
  }

  loadData() {
    totalCount = 0;
    totalPrice = 0;
    for (var element in products) {
      totalPrice += element.price * element.count;
      totalCount += element.count;
    }

    notifyListeners();
  }
}
