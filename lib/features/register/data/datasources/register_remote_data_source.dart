import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/end_points.dart';
import '../../domain/repositories/register_repo.dart';
import '../models/register_model.dart';


abstract class RegisterRemoteDataSources {
  Future<RegisterModel> register(RegisterInput input);
}

class RegisterRemoteDataSourcesImpl implements RegisterRemoteDataSources {
  final DioHelper _dioHelper;
  RegisterRemoteDataSourcesImpl(this._dioHelper);

  @override
  Future<RegisterModel> register(RegisterInput input) async {
    final response = await _dioHelper.post(
      endPoint: registerEndPoint,
      data: {
        'name': input.name,
        'email': input.email,
        'password': input.password,
        'password_confirmation': input.passwordConfirm,
      },
    );

    return RegisterModel.fromJson(response);
  }
}
