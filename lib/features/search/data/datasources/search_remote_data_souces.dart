import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/end_points.dart';
import '../../../get_hotels/data/models/get_hotels_model.dart';
import '../../domain/repositories/search_repo.dart';

abstract class SearchRemoteDataSources {
  Future<GetHotelsModel> search(SearchInput input);
}

class SearchRemoteDataSourcesImpl implements SearchRemoteDataSources {
  final DioHelper _dioHelper;
  SearchRemoteDataSourcesImpl(this._dioHelper);

  @override
  Future<GetHotelsModel> search(SearchInput input) async {
    final response = await _dioHelper.get(
      endPoint: searchEndPoint,
      query: {
        'count': input.count,
        'page': input.page,
        if (input.facilities != null) ...input.facilities!,
        if (input.name != null) 'name': input.name,
        if (input.address != null) 'address': input.address,
        if (input.maxPrice != null) 'max_price': input.maxPrice,
        if (input.minPrice != null) 'min_price': input.minPrice,
        if (input.distance != null) 'distance': input.distance,
        if (input.latitude != null) 'latitude': input.latitude,
        if (input.distance != null) 'distance': input.distance,
      },
    );

    return GetHotelsModel.fromJson(response);
  }
}
