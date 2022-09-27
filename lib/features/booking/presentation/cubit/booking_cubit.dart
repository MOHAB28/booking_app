import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/create_booking_entity.dart';
import '../../domain/entities/get_bookings.dart';
import '../../domain/entities/update_booking_status.dart';
import '../../domain/usecases/create_booking_usecase.dart';
import '../../domain/usecases/get_bookings_usecase.dart';
import '../../domain/usecases/update_booking_usecase.dart';
part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final CreateBookingUsecase createBookingUsecase;
  final UpdateBookingUsecase updateBookingUsecase;
  final GetBookingUsecase getBookingUsecase;
  BookingCubit({
    required this.createBookingUsecase,
    required this.getBookingUsecase,
    required this.updateBookingUsecase,
  }) : super(BookingInitial());

  static BookingCubit get(BuildContext context) =>
      BlocProvider.of(context);

  CreateBookingEntity? createBookingEntity;
  Future<void> createBooking(int hotelId) async {
    emit(CreateBookingLoading());
    final successOrFailure = await createBookingUsecase(hotelId);
    successOrFailure.fold(
      (failure) => emit(CreateBookingFailure()),
      (data) {
        createBookingEntity = data;
        emit(CreateBookingLoaded(data));
      },
    );
  }

  UpdateBookingStatusEntity? updateBookingStatusEntity;
  Future<void> updateBookingStatus({
    required int bookingId,
    required String type,
  }) async {
    emit(UpdateBookingStatusLoading());
    final successOrFailure = await updateBookingUsecase(
      UpdateBookingStatusUsecaseInput(
        bookingId: bookingId,
        type: type,
      ),
    );
    successOrFailure.fold(
      (failure) => emit(UpdateBookingStatusFailure()),
      (data) {
        updateBookingStatusEntity = data;
        emit(UpdateBookingStatusLoaded());
      },
    );
  }

  GetBookingsEntity? getBookingsEntity;
  Future<void> getAllBookins({
    required int count,
    required String type,
  }) async {
    emit(GetAllBookingsLoading());
    final successOrFailure = await getBookingUsecase(
      GetBookingsUsecaseInput(
        count: count,
        type: type,
      ),
    );
    successOrFailure.fold(
      (failure) => emit(GetAllBookingsFailure()),
      (data) {
        getBookingsEntity = data;
        emit(GetAllBookingsLoaded());
      },
    );
  }
}
