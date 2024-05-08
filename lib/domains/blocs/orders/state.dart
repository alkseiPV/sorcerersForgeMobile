import 'package:equatable/equatable.dart';
import 'package:sourcerers_forge/models/order_model.dart';

abstract class OrdersStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialOrdersState extends OrdersStates {}

class LoadingOrdersState extends OrdersStates {}

class LoadedOrdersState extends OrdersStates {
  final List<OrderModel> orders;
  LoadedOrdersState({required this.orders});
  @override
  List<Object?> get props => [orders];
}
