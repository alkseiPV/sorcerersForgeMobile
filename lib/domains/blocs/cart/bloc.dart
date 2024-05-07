import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sourcerers_forge/domains/blocs/cart/event.dart';
import 'package:sourcerers_forge/domains/blocs/cart/state.dart';
import 'package:sourcerers_forge/domains/usecases/cart_usecases.dart';
import 'package:sourcerers_forge/models/cart_product_model.dart';

class CartBloc extends Bloc<CartEvents, CartStates> {
  CartUsecases cartUsecases;
  CartBloc(
    this.cartUsecases,
  ) : super(InitCartState()) {
    on<AddToCartEvent>((event, emit) async {
      cartUsecases.addToCart(event.productId, event.count);
    });

    on<LoadCartEvent>((event, emit) async {
      emit(LoadingCartState());
      List<CartProductModel> carts = await cartUsecases.loadCart();
      emit(LoadedCartState(products: carts));
    });

    on<DeleterFromCartEvent>((event, emit) async {
      cartUsecases.deleteFromCart(event.productId);
    });

    on<CreateOrderEvent>((event, emit) async {
      emit(LoadingCartState());
      await cartUsecases.createOrder();
      emit(LoadedCartState(products: const []));
    });
  }
}
