// To parse this JSON data, do
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

import 'package:phase3/features/profile/domain/entities/profile_entity.dart';

ProfileModel profileFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.status,
    required super.data,
    super.title,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: StatusModel.fromJson(json["status"]),
        data: DataModel.fromJson(json["data"]),
        title:
            json['title'] != null 
            ? TitleModel.fromJson(json['title']) 
            : null,
      );

  Map<String, dynamic> toJson() => {
        "status": StatusModel(type: status.type).toJson(),
        "data": DataModel(
          id: data.id,
          name: data.name,
          email: data.email,
          emailVerifiedAt: data.emailVerifiedAt,
          apiToken: data.apiToken,
          image: data.image,
          createdAt: data.createdAt,
          updatedAt: data.updatedAt,
          googleId: data.googleId,
          provider: data.provider,
        ).toJson(),
        'title': title != null
            ? TitleModel(ar: title!.ar, en: title!.en).toJson()
            : null,
      };
}

class DataModel extends DataEntity {
  const DataModel({
    required super.id,
    required super.name,
    required super.email,
    required super.emailVerifiedAt,
    required super.apiToken,
    required super.image,
    required super.createdAt,
    required super.updatedAt,
    required super.googleId,
    required super.provider,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        apiToken: json["api_token"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        googleId: json["google_id"]??'',
        provider: json["provider"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "api_token": apiToken,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "google_id": googleId,
        "provider": provider,
      };
}

class StatusModel extends StatusEntity {
  const StatusModel({required super.type});

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}

class TitleModel extends TitleEntity {
  const TitleModel({
    required super.ar,
    required super.en,
  });

  factory TitleModel.fromJson(Map<String, dynamic> json) => TitleModel(
        ar: json['ar'],
        en: json['en'],
      );

  Map<String, dynamic> toJson() => {
        'ar': ar,
        'en': en,
      };
}
