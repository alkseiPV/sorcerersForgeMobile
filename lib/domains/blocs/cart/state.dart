import 'package:equatable/equatable.dart';
import 'package:sourcerers_forge/models/cart_product_model.dart';

abstract class CartStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitCartState extends CartStates {}

class LoadingCartState extends CartStates {}

class LoadedCartState extends CartStates {
  final List<CartProductModel> products;

  LoadedCartState({required this.products});

  @override
  List<Object> get props => [products];
}

class ErrorLoadCartState extends CartStates {}
