import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignupUsecase {
final AuthRepository authRepository;

SignupUsecase(this.authRepository);


Future<UserEntity> signUp ({
  required String username,
  required String password,
  required String firstName,
  required String lastName,
  required String email,
}){
  return authRepository.signUp
    (username: username, password: password,
      firstName: firstName, lastName: lastName, email: email);}
}