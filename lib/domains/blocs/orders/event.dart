import 'package:equatable/equatable.dart';

abstract class OrdersEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllOrdersEvent extends OrdersEvents {}
