import 'package:equatable/equatable.dart';
import 'package:sourcerers_forge/models/profile_model.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitProfileState extends ProfileState {}

class LoadingProfileState extends ProfileState {}

class LoadedProfileState extends ProfileState {
  final ProfileModel profiledata;

  LoadedProfileState({required this.profiledata});

  @override
  List<Object> get props => [profiledata];
}

class ErrorProfileState extends ProfileState {}
