import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sourcerers_forge/domains/blocs/authorization/event.dart';
import 'package:sourcerers_forge/domains/blocs/authorization/state.dart';
import 'package:sourcerers_forge/domains/usecases/authorization_usecase.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvents, AuthorizationState> {
  AuthorizationUseCase authorizationUseCase;
  AuthorizationBloc(
    this.authorizationUseCase,
  ) : super(InitAuthorizationState()) {
    on<LogInEvent>((event, emit) async {
      emit(LoadingAuthState());
      Response response = await authorizationUseCase.logIn(event.user);
      if (response.statusCode == 200) {
        emit(AuthenticatedState(token: response.data["token"]));
      } else {
        emit(UnauthenticatedState(error: response.data));
      }
    });

    on<LogOut>((event, emit) async {
      emit(LoadingAuthState());
      authorizationUseCase.logOut();
      await Future.delayed(const Duration(seconds: 1));
      emit(UnauthenticatedState(error: const {'error': 'Error'}));
    });
  }
}
