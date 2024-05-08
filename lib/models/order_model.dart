import 'package:equatable/equatable.dart';
import 'package:sourcerers_forge/models/product_order_model.dart';

class OrderModel extends Equatable {
  final int id;
  final int user_id;
  final List<ProductOrderModel> products;
  final double summ;

  const OrderModel(
      {required this.id,
      required this.products,
      required this.user_id,
      required this.summ});
  @override
  List<Object?> get props => [id, user_id, products];

  factory OrderModel.fromJson(Map json) {
    return OrderModel(
        summ: double.parse(json['summ'].toString()),
        id: json['id'],
        products: (json['Products'] as List)
            .map((e) => ProductOrderModel.fromJson(e))
            .toList(),
        user_id: json['user_id']);
  }
}
