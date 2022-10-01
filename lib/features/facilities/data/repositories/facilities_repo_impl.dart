import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/facilities_remote_data_sources.dart';
import '../../domain/entities/facilities_entity.dart';
import '../../domain/repositories/facilities_repo.dart';

class FacilitiesRepoImpl implements FacilitiesRepo {
  final FacilitiesRemoteDataSources _remoteDataSources;
  final NetworkInfo _networkInfo;
  FacilitiesRepoImpl(this._networkInfo,this._remoteDataSources);

  @override
  Future<Either<PrimaryServerException, FacilitiesEntity>> getFacilities() async {
    if (await _networkInfo.isConnected) {
      final data = await _remoteDataSources.getFacilities();
      return Right(data);
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