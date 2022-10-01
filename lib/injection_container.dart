import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/facilities/domain/usecases/facilities_usecase.dart';
import 'features/facilities/presentation/cubit/facilities_cubit.dart';
import 'features/booking/data/datasources/booking_remote_data_sources.dart';
import 'features/booking/data/repositories/booking_repo_impl.dart';
import 'features/booking/domain/repositories/booking_repo.dart';
import 'features/booking/domain/usecases/create_booking_usecase.dart';
import 'features/booking/domain/usecases/get_bookings_usecase.dart';
import 'features/booking/domain/usecases/update_booking_usecase.dart';
import 'features/booking/presentation/cubit/booking_cubit.dart';
import 'features/facilities/data/datasources/facilities_remote_data_sources.dart';
import 'features/facilities/data/repositories/facilities_repo_impl.dart';
import 'features/facilities/domain/repositories/facilities_repo.dart';
import 'features/profile/domain/usecases/update_profile_use_case.dart';
import 'features/profile/data/datasources/get_profile_remote_data_source.dart';
import 'features/profile/data/repositories/profile_repository_implementaion.dart';
import 'features/profile/domain/repositories/profile_repository.dart';
import 'features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'core/network/network_info.dart';
import 'features/get_hotels/data/datasources/get_hotels_remote.dart';
import 'features/get_hotels/data/repositories/get_hotels_repo_impl.dart';
import 'features/get_hotels/domain/repositories/get_hotels.dart';
import 'features/get_hotels/domain/usecases/get_hotels_usecase.dart';
import 'features/get_hotels/presentation/cubit/get_hotels_cubit.dart';
import 'features/login/data/datasources/login_remote_data_source.dart';
import 'features/login/domain/usecases/login_usecase.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'core/network/dio_helper.dart';
import 'features/login/data/repositories/login_repo_impl.dart';
import 'features/login/domain/repositories/login_repo.dart';
import 'features/profile/domain/usecases/get_profile_use_case.dart';
import 'features/register/data/datasources/register_remote_data_source.dart';
import 'features/register/data/repositories/register_repo_impl.dart';
import 'features/register/domain/repositories/register_repo.dart';
import 'features/register/domain/usecases/register_usecase.dart';
import 'features/register/presentation/cubit/register_cubit.dart';
import 'features/search/data/datasources/search_remote_data_souces.dart';
import 'features/search/data/repositories/search_repo_impl.dart';
import 'features/search/domain/repositories/search_repo.dart';
import 'features/search/domain/usecases/search_usecase.dart';
import 'features/search/presentation/cubit/search_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  sl.registerFactory(
    () => LoginCubit(sl()),
  );
  sl.registerFactory(
    () => RegisterCubit(sl()),
  );

  sl.registerFactory(
    () => GetHotelsCubit(sl()),
  );

  sl.registerFactory(
    () => SearchCubit(sl()),
  );

  sl.registerFactory(
    () => FacilitiesCubit(sl()),
  );

  sl.registerFactory(
    () => ProfileCubit(sl(), sl()),
  );

  sl.registerFactory(
    () => BookingCubit(
      createBookingUsecase: sl(),
      getBookingUsecase: sl(),
      updateBookingUsecase: sl(),
    ),
  );

  // Use cases

  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => GetHotelsUsecase(sl()));
  sl.registerLazySingleton(() => RegisterUsecase(sl()));
  sl.registerLazySingleton(() => GetProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => FacilitiesUsecase(sl()));
  sl.registerLazySingleton(() => CreateBookingUsecase(sl()));
  sl.registerLazySingleton(() => UpdateBookingUsecase(sl()));
  sl.registerLazySingleton(() => GetBookingUsecase(sl()));
  sl.registerLazySingleton(() => SearchUsecase(sl()));
  // Repository

  sl.registerLazySingleton<FacilitiesRepo>(
    () => FacilitiesRepoImpl(sl(), sl()),
  );
  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(sl(), sl()),
  );
  sl.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(sl(), sl()),
  );
  sl.registerLazySingleton<RegisterRepo>(
    () => RegisterRepoImpl(sl(), sl()),
  );
  sl.registerLazySingleton<GetHotelsRepo>(
    () => GetHotelsRepoImpl(sl(), sl()),
  );

  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImplementation(sl(), sl()));

  sl.registerLazySingleton<BookingRepo>(() => BookingRepoImpl(sl(), sl()));
  // Data sources

  sl.registerLazySingleton<LoginRemoteDataSources>(
    () => LoginRemoteDataSourcesImpl(sl()),
  );
  sl.registerLazySingleton<FacilitiesRemoteDataSources>(
    () => FacilitiesRemoteDataSourcesImpl(sl()),
  );
  sl.registerLazySingleton<SearchRemoteDataSources>(
    () => SearchRemoteDataSourcesImpl(sl()),
  );
  sl.registerLazySingleton<RegisterRemoteDataSources>(
    () => RegisterRemoteDataSourcesImpl(sl()),
  );
  sl.registerLazySingleton<GetHotelsRemoteDataSources>(
    () => GetHotelsRemoteDataSourcesImpl(sl()),
  );

  sl.registerLazySingleton<BookingRemoteDataSources>(
    () => BookingRemoteDataSourcesImpl(sl()),
  );

  sl.registerLazySingleton<GetProfileRemoteDataSource>(
      () => GetProfileRemoteDataSourceImplementation(sl()));

  //! Core
  sl.registerLazySingleton<DioHelper>(
    () => DioHelperImpl(),
  );
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
