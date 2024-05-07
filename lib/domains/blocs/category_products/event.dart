import 'package:equatable/equatable.dart';

import 'package:sourcerers_forge/models/product_model.dart';

abstract class CategoryProductsEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProductsEvent extends CategoryProductsEvents {
  final int idCategory;
  LoadProductsEvent({required this.idCategory});
  @override
  List<Object?> get props => [idCategory];
}

class UpdateproductsEvent extends CategoryProductsEvents {
  final ProductModel product;
  UpdateproductsEvent({required this.product});
  @override
  List<Object?> get props => [product];
}
