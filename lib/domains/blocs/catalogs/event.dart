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
