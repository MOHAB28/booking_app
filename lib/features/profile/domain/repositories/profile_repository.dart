import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<PrimaryServerException, ProfileEntity>> getProfile(
      String token);

  Future<Either<PrimaryServerException, ProfileEntity>> updateProfile(
      ProfileData data);
}

class ProfileData {
  final String name, email, image, token;

  ProfileData({
    required this.name,
    required this.email,
    required this.image,
    required this.token,
  });
}
