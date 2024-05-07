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
    List<ProductModel> products = [];
    on<LoadProductsEvent>((event, emit) async {
      emit(LoadingCategoryProductsState());
      try {
        List<ProductModel> allproducts =
            await categoryProductsUseCase.loadAllProducts();
        products = await categoryProductsUseCase
            .loadCategoryProducts(event.idCategory);

        for (int i = 0; i < products.length; i++) {
          ProductModel product =
              allproducts.firstWhere((element) => element.id == products[i].id);
          products[i] = products[i]
              .copyWith(isCart: product.isCart, isFavorite: product.isFavorite);
        }

        emit(LoadedCategoryProductsState(products: products));
      } catch (error) {
        emit(ErrorCategoryProductsState(error: error.toString()));
      }
    });

    on<UpdateproductsEvent>((event, emit) {
      if (state is LoadedCategoryProductsState) {
        products.firstWhere((element) => element.id == event.product.id);
        for (int i = 0; i < products.length; i++) {
          if (event.product.id == products[i].id) {
            products[i] = products[i].copyWith(
                isCart: event.product.isCart,
                isFavorite: event.product.isFavorite);
            break;
          }
        }

        emit(LoadedCategoryProductsState(products: products));
      }
    });
  }
}
