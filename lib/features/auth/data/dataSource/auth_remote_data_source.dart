
import 'package:beauty_product_store/features/auth/data/models/login_response_model.dart';
import 'package:beauty_product_store/features/auth/data/models/requests/resgister_request_model.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_helper.dart';
import '../models/requests/login_request_model.dart';
import '../models/response/login_response_model.dart';

abstract class AuthRemoteDataSource{
Future<LoginResponseModel> login (LoginRequestModel loginRequest);
Future<UserModel> signUp (SignupRequestModel signInRequest);

}
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource{
  final DioHelper dioHelper;
  AuthRemoteDataSourceImpl(this.dioHelper);

  @override
  Future<LoginResponseModel> login(
      LoginRequestModel request,
      ) async {
    final response = await dioHelper.post(
      ApiConstants.login,
      data: request.toJson(),
    );

    return LoginResponseModel.fromJson(response.data);
  }

  @override
  Future<UserModel> signUp(SignupRequestModel signInRequest)async
   {
      final response = await dioHelper.post(ApiConstants.signUp ,
      data: signInRequest.toJson()
      );
      return UserModel.fromJson(response.data);
    }

}
