import '../../../../core/network/dio_helper.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/profile_model.dart';

import '../../../../core/network/end_points.dart';

abstract class GetProfileRemoteDataSource {
  Future<ProfileModel> getProfile(String token);
  Future<ProfileModel> updateProfile(ProfileData data);
}

class GetProfileRemoteDataSourceImplementation
    implements GetProfileRemoteDataSource {
  final DioHelper _dioHelper;
  GetProfileRemoteDataSourceImplementation(this._dioHelper);

//___________________________get Profile method_____________________________
  @override
  Future<ProfileModel> getProfile(String token) async {
    final response = await _dioHelper.get(
      endPoint: profileEndPoint,
      token: token,
    );

    final ProfileModel data = ProfileModel.fromJson(response);
    return data;
  }

//____________________________update Profile method_____________________________
  @override
  Future<ProfileModel> updateProfile(ProfileData data) async {
    final response = await _dioHelper.post(
      endPoint: updateProfileEndPoint,
      token: data.token,
      data: {
        'name': data.name,
        'email': data.email,
        'image': data.image,
      },
    );

    final ProfileModel profile = ProfileModel.fromJson(response);

    return profile;
  }
}
