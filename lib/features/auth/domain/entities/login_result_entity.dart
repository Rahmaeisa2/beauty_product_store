import 'package:beauty_product_store/features/auth/domain/entities/user.dart';

class LoginResultEntity {
  final UserEntity user;
  final String accessToken;
  final String refreshToken;

  const LoginResultEntity({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });
}
