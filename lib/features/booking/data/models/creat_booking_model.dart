import '../../domain/entities/create_booking_entity.dart';

class CreateBookingModel extends CreateBookingEntity {
  CreateBookingModel({
    String? status,
    String? titleAr,
    String? titleEn,
  }) : super(
          status: status!,
          titleAr: titleAr!,
          titleEn: titleEn!,
        );
  factory CreateBookingModel.fromJson(Map<String, dynamic> json) {
    return CreateBookingModel(
      status: json['status']['type'],
      titleAr: json['status']['title']['ar'],
      titleEn: json['status']['title']['en'],
    );
  }
}
