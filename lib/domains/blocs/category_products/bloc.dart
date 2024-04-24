import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sourcerers_forge/domains/blocs/category_products/event.dart';
import 'package:sourcerers_forge/domains/blocs/category_products/state.dart';

import 'package:sourcerers_forge/domains/usecases/catalog_usecases.dart';

import 'package:sourcerers_forge/models/product_model.dart';

class CategoryProductsBloc
    extends Bloc<CategoryProductsEvents, CategoryProductsStates> {
  CatalogUseCases categoryProductsUseCase;
  CategoryProductsBloc(this.categoryProductsUseCase)
      : super(InitialCategoryProductsState()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(LoadingCategoryProductsState());
      try {
        List<ProductModel> products = await categoryProductsUseCase
            .loadCategoryProducts(event.idCategory);
        emit(LoadedCategoryProductsState(products: products));
      } catch (error) {
        emit(ErrorCategoryProductsState(error: error.toString()));
      }
    });
  }
}
