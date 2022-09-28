import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<PrimaryServerException, ProfileEntity>> getProfile();

  Future<Either<PrimaryServerException, ProfileEntity>> updateProfile(
    ProfileData data,
  );
}

class ProfileData {
  final String name, email;
  final File? image;

  ProfileData({
    required this.name,
    required this.email,
    this.image,
  });
}
