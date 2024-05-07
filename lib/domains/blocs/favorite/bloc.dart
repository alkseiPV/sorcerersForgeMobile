import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sourcerers_forge/domains/blocs/favorite/event.dart';
import 'package:sourcerers_forge/domains/blocs/favorite/state.dart';
import 'package:sourcerers_forge/domains/usecases/catalog_usecases.dart';

class FavoriteBloc extends Bloc<FavoriteEvents, FavoritesStates> {
  CatalogUseCases favoriteUsecases;
  FavoriteBloc(
    this.favoriteUsecases,
  ) : super(InitFavoriteState()) {
    on<LoadFavoriteEvent>((event, emit) async {
      List<int> ids = await favoriteUsecases.addAllFavorite();

      emit(LoadedFavoriteState(productsIds: ids));
    });
  }
}
