
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/signup_usecase.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  final SignupUsecase useCase;

  SignupCubit(this.useCase) : super(SignUpIntial());

  Future<void> signUp({
    required String username,
    required String password,
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    emit(SignUpLoading());

    try {
      final user = await useCase.signUp(
        username: username,
        password: password,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );

      print('========== SIGN UP SUCCESS ==========');
      print('User ID: ${user.id}');
      print('Username: ${user.username}');
      print('Name: ${user.fullName}');
      print('Email: ${user.email}');
      print('=====================================');

      emit(SignUpSuccess(user));
    } catch (e) {
      print(' SIGN UP ERROR: $e');

      emit(SignUpError(e.toString()));
    }
  }
}