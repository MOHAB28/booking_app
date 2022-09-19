import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  final LoginDataModel? loginDataModel;
  LoginModel({
    String? status,
    String? titleAr,
    String? titleEn,
    this.loginDataModel,
  }) : super(
          status: status!,
          titleAr: titleAr!,
          titleEn: titleEn!,
          loginDataEntity: loginDataModel!,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status']['type'],
      titleAr: json['status']['title']['ar'],
      titleEn: json['status']['title']['en'],
      loginDataModel:
          json['data'] != null ? LoginDataModel.fromJson(json['data']) : null,
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
      'data': loginDataModel!.toJson(),
    };
    return json;
  }
}

class LoginDataModel extends LoginDataEntity {
  LoginDataModel({
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

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
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
