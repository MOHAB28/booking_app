import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/create_booking_entity.dart';
import '../repositories/booking_repo.dart';

class CreateBookingUsecase extends BaseUseCase<int, CreateBookingEntity> {
  final BookingRepo _repo;
  CreateBookingUsecase(this._repo);
  @override
  Future<Either<PrimaryServerException, CreateBookingEntity>> call(
    int input,
  ) async {
    return await _repo.createBooking(input);
  }
}
