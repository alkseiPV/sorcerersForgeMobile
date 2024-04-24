import 'package:equatable/equatable.dart';

abstract class RegistrationEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterEvent extends RegistrationEvents {
  final Map user;

  RegisterEvent({required this.user});

  @override
  List<Object?> get props => [user];
}
