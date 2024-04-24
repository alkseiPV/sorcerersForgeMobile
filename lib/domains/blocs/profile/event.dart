import 'package:equatable/equatable.dart';
import 'package:sourcerers_forge/models/profile_model.dart';

abstract class ProfileEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProfileEvent extends ProfileEvents {}

class UpdateProfileEvent extends ProfileEvents {
  final ProfileModel profileModel;
  UpdateProfileEvent({required this.profileModel});
  @override
  List<Object?> get props => [profileModel];
}
