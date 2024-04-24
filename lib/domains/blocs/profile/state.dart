import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitProfileState extends ProfileState {}

class LoadingProfileState extends ProfileState {}

class LoadedProfileState extends ProfileState {
  final String token;

  LoadedProfileState({required this.token});

  @override
  List<Object> get props => [token];
}

class ErrorProfileState extends ProfileState {}
