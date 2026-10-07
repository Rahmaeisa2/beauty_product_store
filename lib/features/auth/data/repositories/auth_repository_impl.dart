
import 'package:beauty_product_store/features/auth/domain/entities/user.dart';

import '../../domain/entities/login_result_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../dataSource/auth_remote_data_source.dart';
import '../models/requests/login_request_model.dart';
import '../models/requests/resgister_request_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<LoginResultEntity> login({
    required String username,
    required String password,
  }) async {
    final request = LoginRequestModel(
      username: username,
      password: password,
    );

    final response = await authRemoteDataSource.login(request);

    return LoginResultEntity(
      user: response,
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
  }

  @override
  Future<UserEntity> signUp({
    required String username,
    required String password,
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    final request = SignupRequestModel(
      username: username,
      password: password,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );

    final response = await authRemoteDataSource.signUp(request);

    return response;
  }
}