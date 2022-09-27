import 'package:equatable/equatable.dart';

import '../../../get_hotels/domain/entities/get_hotels_entities.dart';

class GetBookingsEntity extends Equatable {
  final String status;
  final BookingsDataDetailsEntity bookingsDataDetailsEntity;
  const GetBookingsEntity({
    required this.status,
    required this.bookingsDataDetailsEntity,
  });

  @override
  List<Object?> get props => [
        status,
        bookingsDataDetailsEntity,
      ];
}

class BookingsDataDetailsEntity extends Equatable {
  final int currentPage;
  final String firstPageUrl;
  final String lastPageUrl;
  final int from;
  final int lastPage;
  final String nextPageUrl;
  final String path;
  final String perPage;
  final int to;
  final int total;
  final List<AllBookingsEntity> allBookingsEntity;
  const BookingsDataDetailsEntity({
    required this.allBookingsEntity,
    required this.currentPage,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  @override
  List<Object?> get props => [
        allBookingsEntity,
        currentPage,
        firstPageUrl,
        from,
        lastPage,
        lastPageUrl,
        nextPageUrl,
        path,
        perPage,
        to,
        total,
      ];
}

class AllBookingsEntity extends Equatable {
  final int id;
  final String userId;
  final String hotelId;
  final String type;
  final String createdAt;
  final String updatedAt;
  final UserDataEntity userDataEntity;
  final HotelDataEntity hotelDataEntity;
  const AllBookingsEntity({
    required this.createdAt,
    required this.hotelDataEntity,
    required this.hotelId,
    required this.id,
    required this.type,
    required this.updatedAt,
    required this.userDataEntity,
    required this.userId,
  });

  @override
  List<Object?> get props => [
        createdAt,
        hotelDataEntity,
        hotelId,
        id,
        type,
        updatedAt,
        userDataEntity,
        userId,
      ];
}

class UserDataEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String image;
  final String createdAt;
  final String updatedAt;
  final String googleid;
  const UserDataEntity({
    required this.createdAt,
    required this.email,
    required this.googleid,
    required this.id,
    required this.image,
    required this.name,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        createdAt,
        email,
        googleid,
        id,
        image,
        name,
        updatedAt,
      ];
}

