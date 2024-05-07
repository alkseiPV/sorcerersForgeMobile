import 'package:sourcerers_forge/data/dio_service.dart';

import 'package:sourcerers_forge/models/cart_product_model.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/flushbar.dart';

class CartUsecases {
  DioService dioService;

  CartUsecases({required this.dioService});

  loadCart() async {
    List<CartProductModel> empt = [];

    final response = await dioService.getRequest('/cart/getUserCart');

    if (response.data == [] || response.statusCode != 200) {
      return empt;
    } else {
      List<CartProductModel> carts = (response.data['cart'] as List).map((e) {
        return CartProductModel.fromJson(e);
      }).toList();

      return carts;
    }
  }

  addToCart(int productId, int count) async {
    try {
      final response = await dioService.postRequest('/cart/createCart',
          data: {'product_id': productId, 'count': count});
      if (response.statusCode == 201) {
        Flushbar.success(title: 'Успешно добавлено!').show();
      }
    } catch (e) {
      Flushbar.error(title: 'Ошибка сервера! ').show();
    }
  }

  deleteFromCart(int productId) async {
    final resp =
        await dioService.deleteRequest('/cart/deleteCart?productId=$productId');

    if (resp.statusCode == 200) {
      Flushbar.success(title: 'Успешно удалено!').show();
    }
  }

  createOrder() async {
    final resp = await dioService.getRequest('/cart/createOrder');

    if (resp.statusCode == 200) {
      Flushbar.success(title: 'Заказ создан, проверьте почту!').show();
    }
  }
}
