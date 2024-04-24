import 'package:equatable/equatable.dart';

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
