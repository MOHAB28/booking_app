import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/update_booking_status.dart';
import '../repositories/booking_repo.dart';

class UpdateBookingUsecase extends BaseUseCase<UpdateBookingStatusUsecaseInput,
    UpdateBookingStatusEntity> {
  final BookingRepo _repo;
  UpdateBookingUsecase(this._repo);
  @override
  Future<Either<PrimaryServerException, UpdateBookingStatusEntity>> call(
    UpdateBookingStatusUsecaseInput input,
  ) async {
    return await _repo.updateBookingStatus(
      UpdateBookingStatusInput(
        bookingId: input.bookingId,
        type: input.type,
      ),
    );
  }
}

class UpdateBookingStatusUsecaseInput {
  final int bookingId;
  final String type;
  const UpdateBookingStatusUsecaseInput({
    required this.bookingId,
    required this.type,
  });
}
