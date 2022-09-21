
import '../../domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  final RegisterDataModel? registerDataModel;
  RegisterModel({
    String? status,
    String? titleAr,
    String? titleEn,
    this.registerDataModel,
  }) : super(
          status: status!,
          titleAr: titleAr!,
          titleEn: titleEn!,
          registerDataEntity: registerDataModel!,
        );

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status']['type'],
      titleAr: json['status']['title']['ar'],
      titleEn: json['status']['title']['en'],
      registerDataModel:
          json['data'] != null ? RegisterDataModel.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'status': {
        'type': status,
        'title': {
          'ar': titleAr,
          'en': titleEn,
        }
      },
      'data': registerDataModel!.toJson(),
    };
    return json;
  }
}

class RegisterDataModel extends RegisterDataEntity {
  RegisterDataModel({
    int? id,
    String? name,
    String? email,
    dynamic emailVetfAt,
    String? token,
    String? image,
    String? createdAt,
    String? updatedAt,
    dynamic googleId,
    dynamic provider,
  }) : super(
          id: id!,
          name: name!,
          email: email!,
          emailVetfAt: emailVetfAt,
          token: token!,
          image: image!,
          createdAt: createdAt!,
          updatedAt: updatedAt!,
          googleId: googleId,
          provider: provider,
        );

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) {
    return RegisterDataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVetfAt: json['email_verified_at'],
      token: json['api_token'] ?? '',
      image: json['image'] ?? '',
      createdAt: json['created_at'],
      googleId: json['google_id'],
      provider: json['provider'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVetfAt,
      'api_token': token,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'google_id': googleId,
      'provider': provider,
    };
    return json;
  }
}
