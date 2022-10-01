import 'package:phase3/core/network/end_points.dart';

import '../../../../core/network/dio_helper.dart';
import '../models/facilities_model.dart';

abstract class FacilitiesRemoteDataSources {
  Future<FacilitiesModel> getFacilities();
}

class FacilitiesRemoteDataSourcesImpl implements FacilitiesRemoteDataSources {
  final DioHelper _dioHelper;
  FacilitiesRemoteDataSourcesImpl(this._dioHelper);

  @override
  Future<FacilitiesModel> getFacilities() async {
    final response = await _dioHelper.get(
      endPoint: facilitiesEndPoint,
    );

    return FacilitiesModel.fromJson(response);
  }
}
