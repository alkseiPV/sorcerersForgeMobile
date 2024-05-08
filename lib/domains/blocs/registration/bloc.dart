import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sourcerers_forge/domains/blocs/registration/event.dart';
import 'package:sourcerers_forge/domains/blocs/registration/state.dart';
import 'package:sourcerers_forge/domains/usecases/registration_usecase.dart';

class RegistrationBloc extends Bloc<RegistrationEvents, RegistrationStates> {
  RegistrationUseCase registrationUseCase;
  RegistrationBloc(this.registrationUseCase)
      : super(InitialRegistrationState()) {
    on<GetCodeEvent>((event, emit) async {
      emit(LoadingRegistrationState());
      await registrationUseCase.getCode(event.user);
      emit(LoadedSendCodeState());
    });
    on<RegisterEvent>(_onRegisterEvent);
  }

  Future<void> _onRegisterEvent(
    RegisterEvent event,
    Emitter<RegistrationStates> emit,
  ) async {
    emit(LoadingRegistrationState());
    try {
      Response response = await registrationUseCase.registration(event.user);

      if (response.statusCode == 201) {
        emit(RegisteredState());
      } else {
        // ошибка в данных или сервере
        emit(UnRegisteredState(error: response.data));
      }

      emit(RegisteredState());
    } catch (error) {
      // Если произошла ошибка, переходим в состояние UnRegisteredState
      emit(UnRegisteredState(error: error.toString()));
    }
  }
}
