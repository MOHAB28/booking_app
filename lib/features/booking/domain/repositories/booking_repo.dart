import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../entities/create_booking_entity.dart';
import '../entities/get_bookings.dart';
import '../entities/update_booking_status.dart';

abstract class BookingRepo {
  Future<Either<PrimaryServerException, CreateBookingEntity>> createBooking(
    int hotelId,
  );
  Future<Either<PrimaryServerException, UpdateBookingStatusEntity>>
      updateBookingStatus(
    UpdateBookingStatusInput input,
  );
  Future<Either<PrimaryServerException, GetBookingsEntity>> getBookings(
    GetBookingsInput input,
  );
}

class UpdateBookingStatusInput {
  final int bookingId;
  final String type;
  const UpdateBookingStatusInput({
    required this.bookingId,
    required this.type,
  });
}

class GetBookingsInput {
  final int count;
  final String type;
  const GetBookingsInput({
    required this.count,
    required this.type,
  });
}
