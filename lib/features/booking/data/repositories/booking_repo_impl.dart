import 'package:dartz/dartz.dart';
import '../../domain/entities/update_booking_status.dart';
import '../../domain/entities/get_bookings.dart';
import '../../domain/entities/create_booking_entity.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/booking_remote_data_sources.dart';
import '../../domain/repositories/booking_repo.dart';

class BookingRepoImpl implements BookingRepo {
  final NetworkInfo _networkInfo;
  final BookingRemoteDataSources _remoteDataSources;

  BookingRepoImpl(this._networkInfo, this._remoteDataSources);
  @override
  Future<Either<PrimaryServerException, CreateBookingEntity>> createBooking(
    int hotelId,
  ) async {
    if (await _networkInfo.isConnected) {
      final data = await _remoteDataSources.createBooking(hotelId);
      return Right(data);
    } else {
      throw Left(
        PrimaryServerException(
          code: 500,
          error: 'No Internet Connection',
          message: 'Please check your internet connection!',
        ),
      );
    }
  }

  @override
  Future<Either<PrimaryServerException, GetBookingsEntity>> getBookings(
    GetBookingsInput input,
  ) async {
    if (await _networkInfo.isConnected) {
      final data = await _remoteDataSources.getBookings(input);
      return Right(data);
    } else {
      throw Left(
        PrimaryServerException(
          code: 500,
          error: 'No Internet Connection',
          message: 'Please check your internet connection!',
        ),
      );
    }
  }

  @override
  Future<Either<PrimaryServerException, UpdateBookingStatusEntity>>
      updateBookingStatus(
    UpdateBookingStatusInput input,
  ) async {
    if (await _networkInfo.isConnected) {
      final data = await _remoteDataSources.updateBookingStatus(input);
      return Right(data);
    } else {
      throw Left(
        PrimaryServerException(
          code: 500,
          error: 'No Internet Connection',
          message: 'Please check your internet connection!',
        ),
      );
    }
  }
}
