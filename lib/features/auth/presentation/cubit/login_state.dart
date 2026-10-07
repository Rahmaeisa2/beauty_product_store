import '../../domain/entities/login_result_entity.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResultEntity result;

  LoginSuccess(this.result);
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
