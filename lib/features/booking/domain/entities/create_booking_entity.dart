import 'package:equatable/equatable.dart';

class CreateBookingEntity extends Equatable {
  final String status;
  final String titleAr;
  final String titleEn;
  const CreateBookingEntity({
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
