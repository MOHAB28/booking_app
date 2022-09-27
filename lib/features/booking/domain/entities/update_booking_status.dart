import 'package:equatable/equatable.dart';

class UpdateBookingStatusEntity extends Equatable {
  final String status;
  final String titleAr;
  final String titleEn;
  const UpdateBookingStatusEntity({
    required this.status,
    required this.titleAr,
    required this.titleEn,
  });

  @override
  List<Object?> get props => [
        status,
        titleAr,
        titleEn,
      ];
}
