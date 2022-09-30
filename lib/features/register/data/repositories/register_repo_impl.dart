import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../../../login/domain/entities/login_entity.dart';
import '../../domain/repositories/register_repo.dart';
import '../datasources/register_remote_data_source.dart';


class RegisterRepoImpl implements RegisterRepo {
  final NetworkInfo _networkInfo;
  final RegisterRemoteDataSources _remoteDataSources;
  RegisterRepoImpl(this._networkInfo, this._remoteDataSources);
  @override
  Future<Either<PrimaryServerException, AuthEntity>> register(
    RegisterInput input
  ) async {
    if (await _networkInfo.isConnected) {
      final data = await _remoteDataSources.register(input);
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
