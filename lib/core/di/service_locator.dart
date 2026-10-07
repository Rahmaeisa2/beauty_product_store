import 'package:beauty_product_store/core/network/dio_helper.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/dataSource/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/presentation/cubit/login_cubit.dart';



final getIt = GetIt.instance;

void setupDependencies() {
  // Api Client
  getIt.registerLazySingleton<DioHelper>(
        () => DioHelper(),
  );

  // Remote Data Source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(
      getIt<DioHelper>(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      getIt<AuthRemoteDataSource>(),
    ),
  );

  // Use Case
  getIt.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(
      getIt<AuthRepository>(),
    ),
  );

  // Cubit
  getIt.registerFactory<LoginCubit>(
        () => LoginCubit(
      getIt<LoginUseCase>(),
    ),
  );
}
