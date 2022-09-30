import 'package:dartz/dartz.dart';
import '../../domain/entities/login_entity.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/login_remote_data_source.dart';
import '../../domain/repositories/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final NetworkInfo _networkInfo;
  final LoginRemoteDataSources _remoteDataSources;
  LoginRepoImpl(this._networkInfo, this._remoteDataSources);
  @override
  Future<Either<PrimaryServerException, AuthEntity>> login(
    LoginInput input
  ) async {
    if (await _networkInfo.isConnected) {
      final data = await _remoteDataSources.login(input);
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
