import 'package:equatable/equatable.dart';

import 'package:sourcerers_forge/models/product_model.dart';

abstract class ProductsForYouStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialProductsForYouState extends ProductsForYouStates {}

class LoadingProductsForYouState extends ProductsForYouStates {}

class LoadedProductsForYouState extends ProductsForYouStates {
  final List<ProductModel>? products;

  LoadedProductsForYouState({required this.products});

  @override
  List<Object?> get props => [products];
}

class ErrorProductsForYouState extends ProductsForYouStates {
  final String error;

  ErrorProductsForYouState({required this.error});

  @override
  List<Object?> get props => [error];
}
