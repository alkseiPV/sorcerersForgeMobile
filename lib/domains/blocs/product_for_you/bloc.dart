import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sourcerers_forge/domains/blocs/product_for_you/event.dart';
import 'package:sourcerers_forge/domains/blocs/product_for_you/state.dart';

import 'package:sourcerers_forge/domains/usecases/catalog_usecases.dart';

import 'package:sourcerers_forge/models/product_model.dart';

class ProductsForYouBloc
    extends Bloc<ProductsForYouEvents, ProductsForYouStates> {
  CatalogUseCases catalogUseCases;
  ProductsForYouBloc(this.catalogUseCases)
      : super(InitialProductsForYouState()) {
    on<LoadProductEvent>((event, emit) async {
      emit(LoadingProductsForYouState());
      try {
        List<ProductModel> products = await catalogUseCases.loadAllProducts();
        products.shuffle();
        List<ProductModel> randomProducts = products.take(6).toList();
        emit(LoadedProductsForYouState(products: randomProducts));
      } catch (error) {
        emit(ErrorProductsForYouState(error: error.toString()));
      }
    });
  }
}
