import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sourcerers_forge/domains/blocs/profile/event.dart';
import 'package:sourcerers_forge/domains/blocs/profile/state.dart';

import 'package:sourcerers_forge/domains/usecases/profile_usecases.dart';

// Объявление Bloc
class ProfileBloc extends Bloc<ProfileEvents, ProfileState> {
  ProfileUseCases profileUseCase;
  ProfileBloc(
    this.profileUseCase,
  ) : super(InitProfileState()) {
    on<LoadProfileEvent>((event, emit) async {});

    on<UpdateProfileEvent>((event, emit) async {
      emit(LoadingProfileState());
      await Future.delayed(const Duration(seconds: 1));
      emit(ErrorProfileState());
    });
  }
}
