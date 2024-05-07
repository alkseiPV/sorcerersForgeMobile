import 'package:equatable/equatable.dart';

abstract class FavoriteEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFavoriteEvent extends FavoriteEvents {}
