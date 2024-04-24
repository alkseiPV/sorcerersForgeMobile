import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sourcerers_forge/domains/blocs/catalogs/event.dart';
import 'package:sourcerers_forge/domains/blocs/catalogs/state.dart';
import 'package:sourcerers_forge/domains/usecases/catalog_usecases.dart';
import 'package:sourcerers_forge/models/category_model.dart';
import 'package:sourcerers_forge/models/product_model.dart';

class CatalogBloc extends Bloc<CatalogEvents, CatalogStates> {
  CatalogUseCases catalogUseCase;
  CatalogBloc(this.catalogUseCase) : super(InitialCatalogState()) {
    on<LoadCatalogEvent>(_onCatalogLoadEvent);
    on<LoadProductsEvent>((event, emit) async {
      emit(LoadingCatalogState());
      try {
        List<ProductModel> products =
            await catalogUseCase.loadCategoryProducts(event.idCategory);
        emit(LoadedCatalogState(categories: null, products: products));
      } catch (error) {
        emit(ErrorCatalogState(error: error.toString()));
      }
    });
  }

  Future<void> _onCatalogLoadEvent(
    CatalogEvents event,
    Emitter<CatalogStates> emit,
  ) async {
    emit(LoadingCatalogState());
    try {
      List<CategoryModel> categories = await catalogUseCase.loadAllCategories();
      List<ProductModel> products = await catalogUseCase.loadAllProducts();

      emit(LoadedCatalogState(categories: categories, products: products));
    } catch (error) {
      emit(ErrorCatalogState(error: error.toString()));
    }
  }

  Future<void> _onCategoryLoadEvent(
    CatalogEvents event,
    Emitter<CatalogStates> emit,
  ) async {}
}
