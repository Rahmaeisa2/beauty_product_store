
import '../../data/models/requests/login_request_model.dart';

import '../entities/login_result_entity.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<LoginResultEntity> login({
    required String username,
    required String password,
  });
  Future<UserEntity> signUp({
    required String username,
    required String password,
    required String firstName,
    required String lastName,
    required String email,
  });
}

