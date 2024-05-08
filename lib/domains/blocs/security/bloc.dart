import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sourcerers_forge/domains/blocs/security/event.dart';
import 'package:sourcerers_forge/domains/blocs/security/state.dart';
import 'package:sourcerers_forge/domains/usecases/profile_usecases.dart';

class SecurityBloc extends Bloc<SecurityEvents, SecurityStates> {
  ProfileUseCases profileUseCases;
  SecurityBloc(this.profileUseCases) : super(InitialSecurityState()) {
    on<GetCodeEvent>((event, emit) async {
      emit(LoadingSecurityState());
      await profileUseCases.sendCode(event.email);
      emit(InitialSecurityState());
    });

    on<ResetPassEvent>((event, emit) async {
      emit(LoadingSecurityState());
      await profileUseCases.resetPass(event.data, event.isprofile);
      emit(LoadedSecurityState());
    });
  }
}
