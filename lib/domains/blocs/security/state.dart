import 'package:equatable/equatable.dart';

abstract class SecurityStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialSecurityState extends SecurityStates {}

class LoadingSecurityState extends SecurityStates {}

class LoadedSecurityState extends SecurityStates {}

class ErrorSecurityState extends SecurityStates {}
