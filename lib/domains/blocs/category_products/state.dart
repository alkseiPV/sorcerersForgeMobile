import 'package:equatable/equatable.dart';

import 'package:sourcerers_forge/models/product_model.dart';

abstract class CategoryProductsStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialCategoryProductsState extends CategoryProductsStates {}

class LoadingCategoryProductsState extends CategoryProductsStates {}

class LoadedCategoryProductsState extends CategoryProductsStates {
  final List<ProductModel>? products;

  LoadedCategoryProductsState({required this.products});

  @override
  List<Object?> get props => [products];
}

class ErrorCategoryProductsState extends CategoryProductsStates {
  final String error;

  ErrorCategoryProductsState({required this.error});

  @override
  List<Object?> get props => [error];
}
