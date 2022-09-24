part of 'booking_cubit.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {}

class CreateBookingLoading extends BookingState {}

class CreateBookingFailure extends BookingState {}

class CreateBookingLoaded extends BookingState {}

class UpdateBookingStatusLoading extends BookingState {}

class UpdateBookingStatusFailure extends BookingState {}

class UpdateBookingStatusLoaded extends BookingState {}

class GetAllBookingsLoading extends BookingState {}

class GetAllBookingsFailure extends BookingState {}

class GetAllBookingsLoaded extends BookingState {}

