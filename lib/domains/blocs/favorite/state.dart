import 'package:equatable/equatable.dart';

abstract class FavoritesStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitFavoriteState extends FavoritesStates {}

class LoadingFavoriteState extends FavoritesStates {}

class LoadedFavoriteState extends FavoritesStates {
  final List<int> productsIds;

  LoadedFavoriteState({required this.productsIds});

  @override
  List<Object> get props => [productsIds];
}

class ErrorLoadFavoriteState extends FavoritesStates {}
