import 'package:equatable/equatable.dart';

abstract class CatalogEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCatalogEvent extends CatalogEvents {}

class LoadProductsEvent extends CatalogEvents {
  final int idCategory;
  LoadProductsEvent({required this.idCategory});
  @override
  List<Object?> get props => [idCategory];
}

class LoadReviewsEvent extends CatalogEvents {
  final int idProduct;
  LoadReviewsEvent({required this.idProduct});
  @override
  List<Object?> get props => [idProduct];
}

class AddtoFavoriteEvent extends CatalogEvents {
  final int idProduct;
  final bool added;

  AddtoFavoriteEvent({required this.idProduct, required this.added});
  @override
  List<Object?> get props => [idProduct];
}
