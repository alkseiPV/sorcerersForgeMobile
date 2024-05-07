// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class CartProductModel extends Equatable {
  final int id;
  final int user_id;
  final int product_id;
  final String user_email;
  final String product_name;
  final int count;
  final double price;
  final String photo;

  const CartProductModel(
      {required this.count,
      required this.id,
      required this.photo,
      required this.price,
      required this.product_id,
      required this.product_name,
      required this.user_email,
      required this.user_id});

  @override
  List<Object?> get props =>
      [id, user_id, product_id, user_email, product_name, count, price, photo];

  static CartProductModel fromJson(Map json) {
    return CartProductModel(
      count: json['count'],
      id: json['id'],
      photo: json['photo'],
      price: double.parse(json['price'].toString()),
      product_id: json['product_id'],
      product_name: json['product_name'],
      user_email: json['user_email'],
      user_id: json['user_id'],
    );
  }

  CartProductModel copyWith({
    int? id,
    int? userId,
    int? productId,
    String? userEmail,
    String? productName,
    int? count,
    double? price,
    String? photo,
  }) {
    return CartProductModel(
      id: id ?? this.id,
      user_id: userId ?? user_id,
      product_id: productId ?? product_id,
      user_email: userEmail ?? user_email,
      product_name: productName ?? product_name,
      count: count ?? this.count,
      price: price ?? this.price,
      photo: photo ?? this.photo,
    );
  }
}
