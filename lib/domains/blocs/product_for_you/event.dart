import 'package:equatable/equatable.dart';

abstract class ProductsForYouEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProductEvent extends ProductsForYouEvents {}
