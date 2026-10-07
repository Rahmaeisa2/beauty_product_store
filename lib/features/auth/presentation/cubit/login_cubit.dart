import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase useCase;

  LoginCubit(this.useCase) : super(LoginInitial());

  Future<void> login({
    required String userName,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      print(' LOGIN STARTED');
      print('Username: $userName');

      final result = await useCase(
        username: userName,
        password: password,
      );

      print('========== LOGIN SUCCESS ==========');
      print('Username: ${result.user.username}');
      print('Name: ${result.user.fullName}');
      print('Email: ${result.user.email}');
      print('User ID: ${result.user.id}');
      print('Access Token: ${result.accessToken}');
      print('Refresh Token: ${result.refreshToken}');
      print('===================================');

      emit(LoginSuccess(result));
    } catch (e) {
      print(' LOGIN ERROR: $e');

      emit(LoginError(e.toString()));
    }
  }

}