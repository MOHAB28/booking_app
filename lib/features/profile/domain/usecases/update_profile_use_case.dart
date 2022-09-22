import '../../../../core/error/exception.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class UpdateProfileUseCase
    extends BaseUseCase<ProfileUseCaseData, ProfileEntity> {
  final ProfileRepository _repository;

  UpdateProfileUseCase(this._repository);

  @override
  Future<Either<PrimaryServerException, ProfileEntity>> call(input) async {
    return await _repository.updateProfile(ProfileData(
      name: input.name,
      email: input.email,
      image: input.image,
      token: input.token,
    ));
  }
}

class ProfileUseCaseData {
  final String name, email, image, token;

  ProfileUseCaseData({
    required this.name,
    required this.email,
    required this.image,
    required this.token,
  });
}
