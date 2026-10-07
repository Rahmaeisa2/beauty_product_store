import 'package:beauty_product_store/features/auth/domain/entities/user.dart';

import '../../domain/entities/login_result_entity.dart';

abstract class SignUpState {}

class SignUpIntial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserEntity result;

  SignUpSuccess(this.result);
}

class SignUpError extends SignUpState {
  final String message;

  SignUpError(this.message);
}
