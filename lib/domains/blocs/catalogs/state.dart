import 'package:equatable/equatable.dart';
import 'package:sourcerers_forge/models/category_model.dart';
import 'package:sourcerers_forge/models/product_model.dart';
import 'package:sourcerers_forge/models/review_model.dart';

abstract class CatalogStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialCatalogState extends CatalogStates {}

class LoadingCatalogState extends CatalogStates {}

class LoadedCatalogState extends CatalogStates {
  final List<CategoryModel>? categories;
  final List<ProductModel>? products;

  LoadedCatalogState({required this.categories, required this.products});

  @override
  List<Object?> get props => [categories, products];
}

class LoadedReviewState extends CatalogStates {
  final List<ReviewModel> reviews;
  LoadedReviewState({required this.reviews});

  @override
  List<Object?> get props => [reviews];
}

class ErrorCatalogState extends CatalogStates {
  final String error;

  ErrorCatalogState({required this.error});

  @override
  List<Object?> get props => [error];
}
