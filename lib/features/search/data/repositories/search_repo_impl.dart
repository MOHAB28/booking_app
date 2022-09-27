import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../../../get_hotels/domain/entities/get_hotels_entities.dart';
import '../datasources/search_remote_data_souces.dart';
import '../../domain/repositories/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final NetworkInfo _networkInfo;
  final SearchRemoteDataSources _remoteDataSources;
  SearchRepoImpl(this._networkInfo, this._remoteDataSources);

  @override
  Future<Either<PrimaryServerException, GetHotelsEntity>> search(
      SearchInput input) async {
    if (await _networkInfo.isConnected) {
      final data = await _remoteDataSources.search(input);
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
