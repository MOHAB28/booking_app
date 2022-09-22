import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final StatusEntity status;
  final DataEntity data;
  final TitleEntity? title;

  const ProfileEntity({required this.status, required this.data, this.title});

  @override
  List<Object?> get props => [status, data];
}

class StatusEntity extends Equatable {
  final String type;

  const StatusEntity({required this.type});

  @override
  List<Object?> get props => [type];
}

class DataEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final String apiToken;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String googleId;
  final dynamic provider;

  const DataEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.apiToken,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.googleId,
    required this.provider,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        emailVerifiedAt,
        apiToken,
        image,
        createdAt,
        updatedAt,
        googleId,
        provider,
      ];
}

class TitleEntity extends Equatable {
  final String ar;
  final String en;

  const TitleEntity({required this.ar, required this.en});

  @override
  List<Object?> get props => [ar, en];
}
