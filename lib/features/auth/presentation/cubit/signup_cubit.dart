
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/signup_usecase.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  final SignupUsecase useCase;

  SignupCubit(this.useCase) : super(SignUpIntial());

  Future<void> signUp({
    required String username,
    required String password,
    required String Name,
    required String email,
  }) async {
    print('1️⃣ SignupCubit: method called');

    emit(SignUpLoading());
    print('2️⃣ SignupCubit: Loading emitted');

    try {
      print('3️⃣ Calling SignupUsecase');

      final user = await useCase.signUp(
        username: username,
        password: password,
        Name: Name,
        email: email,
      );

      print('4️⃣ SignupUsecase completed');
      print('User ID: ${user.id}');
      print('Username: ${user.username}');

      emit(SignUpSuccess(user));
      print('5️⃣ SignupSuccess emitted');
    } catch (e, stackTrace) {
      print('❌ Signup failed: $e');
      print(stackTrace);

      emit(SignUpError(e.toString()));
    }
  }
}
