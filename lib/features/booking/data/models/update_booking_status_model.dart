import '../../domain/entities/update_booking_status.dart';

class UpdateBookingStatusModel extends UpdateBookingStatusEntity {
  UpdateBookingStatusModel({
    String? status,
    String? titleAr,
    String? titleEn,
  }) : super(
          status: status!,
          titleAr: titleAr!,
          titleEn: titleEn!,
        );
  factory UpdateBookingStatusModel.fromJson(Map<String, dynamic> json) {
    return UpdateBookingStatusModel(
      status: json['status']['type'],
      titleAr: json['status']['title']['ar'],
      titleEn: json['status']['title']['en'],
    );
  }
}
