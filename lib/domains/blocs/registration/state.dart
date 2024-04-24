import 'package:equatable/equatable.dart';

abstract class RegistrationStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialRegistrationState extends RegistrationStates {}

class LoadingRegistrationState extends RegistrationStates {}

class RegisteredState extends RegistrationStates {}

class UnRegisteredState extends RegistrationStates {
  final String error;
  UnRegisteredState({required this.error});

  @override
  List<Object?> get props => [error];
}
