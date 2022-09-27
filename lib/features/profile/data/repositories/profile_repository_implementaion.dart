import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/get_profile_remote_data_source.dart';

class ProfileRepositoryImplementation implements ProfileRepository {
  final GetProfileRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  ProfileRepositoryImplementation(this._remoteDataSource, this._networkInfo);

  //__________________________get profile_____________________________________
  @override
  Future<Either<PrimaryServerException, ProfileEntity>> getProfile(
      ) async {
    if (await _networkInfo.isConnected) {
      final ProfileEntity profileData =
          await _remoteDataSource.getProfile();
      return Right(profileData);
    } else {
      throw Left(
        PrimaryServerException(
          code: 500,
          error: 'No Internet Connection',
          message: 'Please check your internet connection!',
        ),
      );
    }
  }

  //__________________________update profile_____________________________________
  @override
  Future<Either<PrimaryServerException, ProfileEntity>> updateProfile(
      ProfileData data) async {
    if (await _networkInfo.isConnected) {
      final ProfileEntity profile = await _remoteDataSource.updateProfile(data);
      return Right(profile);
    } else {
      throw Left(
        PrimaryServerException(
          code: 500,
          error: 'No Internet Connection',
          message: 'Please check your internet connection!',
        ),
      );
    }
  }
}
