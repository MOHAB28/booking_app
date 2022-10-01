import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String status;
  final String titleAr;
  final String titleEn;
  final dynamic authDataEntity;

  const AuthEntity({
    required this.authDataEntity,
    required this.status,
    required this.titleAr,
    required this.titleEn,
  });

  @override
  List<Object?> get props => [
        authDataEntity,
        status,
        titleAr,
        titleEn,
      ];
}

class AuthDataEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final dynamic emailVetfAt;
  final String token;
  final String image;
  final String createdAt;
  final String updatedAt;
  final dynamic googleId;
  final dynamic provider;

  const AuthDataEntity({
    required this.createdAt,
    required this.email,
    required this.emailVetfAt,
    required this.googleId,
    required this.id,
    required this.image,
    required this.name,
    required this.provider,
    required this.token,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        createdAt,
        email,
        emailVetfAt,
        googleId,
        id,
        image,
        name,
        provider,
        token,
        updatedAt,
      ];
}
