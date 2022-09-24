import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/end_points.dart';
import '../../../../main.dart';
import '../../domain/repositories/booking_repo.dart';
import '../models/creat_booking_model.dart';
import '../models/get_booking_model.dart';
import '../models/update_booking_status_model.dart';

abstract class BookingRemoteDataSources {
  Future<CreateBookingModel> createBooking(
    int hotelId,
  );
  Future<UpdateBookingStatusModel> updateBookingStatus(
    UpdateBookingStatusInput input,
  );
  Future<GetBookingsModel> getBookings(
    GetBookingsInput input,
  );
}

class BookingRemoteDataSourcesImpl implements BookingRemoteDataSources {
  final DioHelper _dioHelper;
  BookingRemoteDataSourcesImpl(this._dioHelper);

  @override
  Future<CreateBookingModel> createBooking(int hotelId) async {
    final response = await _dioHelper.post(
      endPoint: createBookingEndPoint,
      token: token ?? 'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
      data: {'hotel_id': hotelId},
    );

    return CreateBookingModel.fromJson(response);
  }

  @override
  Future<UpdateBookingStatusModel> updateBookingStatus(
    UpdateBookingStatusInput input,
  ) async {
    final response = await _dioHelper.post(
      endPoint: updateProfileEndPoint,
      data: {
        'booking_id': input.bookingId,
        'type': input.type,
      },
    );
    return UpdateBookingStatusModel.fromJson(response);
  }

  @override
  Future<GetBookingsModel> getBookings(GetBookingsInput input) async {
    final response = await _dioHelper.get(
      endPoint: bookingEndPoint,
      token: token ?? 'DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
      query: {
        'count': input.count,
        'type': input.type,
      },
    );

    return GetBookingsModel.fromJson(response);
  }
}
