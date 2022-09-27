import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/end_points.dart';
import '../../../../main.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/profile_model.dart';

abstract class GetProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
  Future<ProfileModel> updateProfile(ProfileData data);
}

class GetProfileRemoteDataSourceImplementation
    implements GetProfileRemoteDataSource {
  final DioHelper _dioHelper;
  GetProfileRemoteDataSourceImplementation(this._dioHelper);

//___________________________get Profile method_____________________________
  @override
  Future<ProfileModel> getProfile() async {
    final response = await _dioHelper.get(
      endPoint: profileEndPoint,
      token: token ?? '',
    );

    return ProfileModel.fromJson(response);
  }

//____________________________update Profile method_____________________________
  @override
  Future<ProfileModel> updateProfile(ProfileData data) async {
    final response = await _dioHelper.post(
      endPoint: updateProfileEndPoint,
      token: token ?? 'hlx2J3tu5PBN9I1Zufz8cuWFW7FlPO0AvuRaUrBfunhgeVds3vjNHGflLyfi',
      isMultipart: data.image != null ? true : false,
      data: {
        'name': data.name,
        'email': data.email,
        if (data.image != null) 'image': data.image,
      },
    );

    return ProfileModel.fromJson(response);
  }
}
