import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:phase3/features/register/presentation/cubit/register_cubit.dart';
import 'core/network/network_info.dart';
import 'features/login/data/datasources/login_remote_data_source.dart';
import 'features/login/domain/usecases/login_usecase.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'core/network/dio_helper.dart';
import 'features/login/data/repositories/login_repo_impl.dart';
import 'features/login/domain/repositories/login_repo.dart';
import 'features/register/data/datasources/register_remote_data_source.dart';
import 'features/register/data/repositories/register_repo_impl.dart';
import 'features/register/domain/repositories/register_repo.dart';
import 'features/register/domain/usecases/register_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Login

  sl.registerFactory(
    () => LoginCubit(sl()),
  );

  //! Features - Register

  sl.registerFactory(
        () => RegisterCubit(sl()),
  );
  
  // Use cases

  sl.registerLazySingleton(() => LoginUsecase(sl()));

  sl.registerLazySingleton(() => RegisterUsecase(sl()));

  // Repository

  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(sl(), sl()),
  );

  sl.registerLazySingleton<RegisterRepo>(
        () => RegisterRepoImpl(sl(), sl()),
  );

  // Data sources

  sl.registerLazySingleton<LoginRemoteDataSources>(
    () => LoginRemoteDataSourcesImpl(sl()),
  );
  sl.registerLazySingleton<RegisterRemoteDataSources>(
        () => RegisterRemoteDataSourcesImpl(sl()),
  );

  //! Core
  sl.registerLazySingleton<DioHelper>(
    () => DioHelperImpl(),
  );
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
