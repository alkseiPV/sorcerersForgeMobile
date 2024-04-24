import 'package:equatable/equatable.dart';

abstract class AuthorizationEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogInEvent extends AuthorizationEvents {
  final Map user;
  LogInEvent({required this.user});
  @override
  List<Object?> get props => [user];
}

class LogOut extends AuthorizationEvents {}
