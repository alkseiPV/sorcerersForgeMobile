import 'package:equatable/equatable.dart';

abstract class CartEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCartEvent extends CartEvents {}

class AddToCartEvent extends CartEvents {
  final int productId;
  final int count;
  AddToCartEvent({required this.productId, required this.count});
  @override
  List<Object?> get props => [productId, count];
}

class DeleterFromCartEvent extends CartEvents {
  final int productId;
  DeleterFromCartEvent({required this.productId});
  @override
  List<Object?> get props => [productId];
}

class CreateOrderEvent extends CartEvents {}
