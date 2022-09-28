import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class UpdateProfileUseCase
    extends BaseUseCase<ProfileUseCaseData, ProfileEntity> {
  final ProfileRepository _repository;

  UpdateProfileUseCase(this._repository);

  @override
  Future<Either<PrimaryServerException, ProfileEntity>> call(input) async {
    return await _repository.updateProfile(
      ProfileData(
        name: input.name,
        email: input.email,
        image: input.image,
      ),
    );
  }
}

class ProfileUseCaseData {
  final String name, email;
  final File? image;

  ProfileUseCaseData({
    required this.name,
    required this.email,
    this.image,
  });
}
