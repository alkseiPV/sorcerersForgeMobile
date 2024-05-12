import 'package:equatable/equatable.dart';

abstract class AuthorizationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitAuthorizationState extends AuthorizationState {}

class LoadingAuthState extends AuthorizationState {}

class AuthenticatedState extends AuthorizationState {
  final String token;

  AuthenticatedState({required this.token});

  @override
  List<Object> get props => [token];
}

class UnauthenticatedState extends AuthorizationState {
  final Map error;
  UnauthenticatedState({required this.error});
}
