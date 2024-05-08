import 'package:equatable/equatable.dart';

class ProductOrderModel extends Equatable {
  final int product_id;
  final int count;

  const ProductOrderModel({required this.product_id, required this.count});

  factory ProductOrderModel.fromJson(Map json) {
    return ProductOrderModel(
        product_id: json['product_id'], count: json['count']);
  }

  @override
  List<Object?> get props => [];
}
