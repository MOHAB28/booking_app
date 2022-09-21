import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/get_hotels_remote.dart';
import '../../domain/entities/get_hotels_entities.dart';
import '../../../../core/error/exception.dart';
import '../../domain/repositories/get_hotels.dart';

class GetHotelsRepoImpl implements GetHotelsRepo {
  final NetworkInfo _networkInfo;
  final GetHotelsRemoteDataSources _remoteDataSources;
  GetHotelsRepoImpl(this._networkInfo, this._remoteDataSources);
  @override
  Future<Either<PrimaryServerException, GetHotelsEntity>> getHotels(
      int page) async {
    if (await _networkInfo.isConnected) {
      final data = await _remoteDataSources.getHotels(page);
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
