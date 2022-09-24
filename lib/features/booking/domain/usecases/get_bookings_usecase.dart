import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_bookings.dart';
import '../repositories/booking_repo.dart';

class GetBookingUsecase
    extends BaseUseCase<GetBookingsUsecaseInput, GetBookingsEntity> {
  final BookingRepo _repo;
  GetBookingUsecase(this._repo);
  @override
  Future<Either<PrimaryServerException, GetBookingsEntity>> call(
    GetBookingsUsecaseInput input,
  ) async {
    return await _repo.getBookings(
      GetBookingsInput(
        count: input.count,
        type: input.type,
      ),
    );
  }
}

class GetBookingsUsecaseInput {
  final int count;
  final String type;
  const GetBookingsUsecaseInput({
    required this.count,
    required this.type,
  });
}
