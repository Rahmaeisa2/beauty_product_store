import 'package:beauty_product_store/core/network/dio_helper.dart';
import 'package:beauty_product_store/features/auth/domain/usecases/signup_usecase.dart';
import 'package:beauty_product_store/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:beauty_product_store/features/location/data/datasource/location_remote_data_source.dart';
import 'package:beauty_product_store/features/location/data/repositories/location_repo_impl.dart';
import 'package:beauty_product_store/features/location/domain/repository/location_repo.dart';
import 'package:beauty_product_store/features/location/domain/usecase/location_usecase.dart';
import 'package:beauty_product_store/features/location/presentation/cubit/location_cibit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/dataSource/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/presentation/cubit/login_cubit.dart';
import '../storage/flutter_secure_storage.dart';



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
          getIt<SecureStorageService>(),

        ),
  );
  getIt.registerLazySingleton<SignupUsecase>(
        () => SignupUsecase(
      getIt<AuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<SecureStorageService>(
        () => SecureStorageService(),
  );
  // Cubit
  getIt.registerFactory<SignupCubit>(
        () => SignupCubit(
      getIt<SignupUsecase>(),

        ),
  );
  getIt.registerLazySingleton<LocationRemoteDataSource>(
        () => LocationRemoteDataSource(
    ),
  );

  // Repository
  getIt.registerLazySingleton<LocationRepository>(
        () => LocationRepositoryImpl(
      getIt<LocationRemoteDataSource>(),
    ),
  );

  // Use Case
  getIt.registerLazySingleton<GetCurrentLocation>(
        () => GetCurrentLocation(
      getIt<LocationRepository>(),
    ),
  );

  // Cubit
  getIt.registerFactory<LocationCubit>(
        () => LocationCubit(
      getIt<GetCurrentLocation>()),
  );
}
