import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/end_points.dart';
import '../models/get_hotels_model.dart';

abstract class GetHotelsRemoteDataSources {
  Future<GetHotelsModel> getHotels(int page);
}

class GetHotelsRemoteDataSourcesImpl implements GetHotelsRemoteDataSources {
  final DioHelper _dioHelper;
  GetHotelsRemoteDataSourcesImpl(this._dioHelper);

  @override
  Future<GetHotelsModel> getHotels(int page) async {
    final response = await _dioHelper.get(
      endPoint: hotelsEndPoint,
      query: {
        'page': page,
        'count': 3,
      },
    );

    return GetHotelsModel.fromJson(response);
  }
}
