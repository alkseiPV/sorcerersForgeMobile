import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sourcerers_forge/domains/blocs/orders/event.dart';
import 'package:sourcerers_forge/domains/blocs/orders/state.dart';
import 'package:sourcerers_forge/domains/usecases/profile_usecases.dart';
import 'package:sourcerers_forge/models/order_model.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersStates> {
  ProfileUseCases profileUseCases;
  OrdersBloc(this.profileUseCases) : super(InitialOrdersState()) {
    on<GetAllOrdersEvent>((event, emit) async {
      emit(LoadingOrdersState());

      List<OrderModel> orders = await profileUseCases.getOrderHistory();
      emit(LoadedOrdersState(orders: orders));
    });
  }
}
