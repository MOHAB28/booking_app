import '../../../get_hotels/data/models/get_hotels_model.dart';
import '../../domain/entities/get_bookings.dart';

class GetBookingsModel extends GetBookingsEntity {
  final BookingsDataDetailsModel? bookingsDataDetailsModel;
  GetBookingsModel({
    String? status,
    this.bookingsDataDetailsModel,
  }) : super(
          status: status!,
          bookingsDataDetailsEntity: bookingsDataDetailsModel!,
        );

  factory GetBookingsModel.fromJson(Map<String, dynamic> json) {
    return GetBookingsModel(
      status: json['status']['type'],
      bookingsDataDetailsModel: json['data'] != null
          ? BookingsDataDetailsModel.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'status': {'type': status},
      'data': bookingsDataDetailsModel != null
          ? bookingsDataDetailsModel!.toJson()
          : null
    };
    return json;
  }
}

class BookingsDataDetailsModel extends BookingsDataDetailsEntity {
  final List<AllBookingsModel>? allBookings;
  BookingsDataDetailsModel({
    int? currentPage,
    int? from,
    int? lastPage,
    int? to,
    int? total,
    String? lastPageUrl,
    String? firstPageUrl,
    String? nextPageUrl,
    String? path,
    String? perPage,
    this.allBookings,
  }) : super(
          allBookingsEntity: allBookings!,
          currentPage: currentPage!,
          from: from!,
          lastPage: lastPage!,
          to: to!,
          total: total!,
          lastPageUrl: lastPageUrl!,
          firstPageUrl: firstPageUrl!,
          nextPageUrl: nextPageUrl!,
          path: path!,
          perPage: perPage!,
        );

  factory BookingsDataDetailsModel.fromJson(Map<String, dynamic> json) {
    List<AllBookingsModel> bookings = [];
    if (json['data'] != null) {
      for (var booking in json['data']) {
        bookings.add(AllBookingsModel.fromJson(booking));
      }
    }
    return BookingsDataDetailsModel(
      currentPage: json['current_page'],
      allBookings: bookings,
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'current_page': currentPage,
      'first_page_url': firstPageUrl,
      'from': from,
      'last_page': lastPage,
      'last_page_url': lastPageUrl,
      'next_page_url': nextPageUrl,
      'path': path,
      'per_page': perPage,
      'to': to,
      'total': total,
      'data': allBookings != null
          ? allBookings!.map((booking) => booking.toJson()).toList()
          : null,
    };
    return json;
  }
}

class AllBookingsModel extends AllBookingsEntity {
  final UserDataModel? userDataModel;
  final HotelDataModel? hotelDataModel;
  AllBookingsModel({
    int? id,
    String? userId,
    String? hotelId,
    String? type,
    String? createdAt,
    String? updatedAt,
    this.hotelDataModel,
    this.userDataModel,
  }) : super(
          createdAt: createdAt!,
          id: id!,
          userId: userId!,
          hotelId: hotelId!,
          type: type!,
          updatedAt: updatedAt!,
          hotelDataEntity: hotelDataModel!,
          userDataEntity: userDataModel!,
        );

  factory AllBookingsModel.fromJson(Map<String, dynamic> json) {
    return AllBookingsModel(
      id: json['id'],
      userId: json['user_id'],
      hotelId: json['hotel_id'],
      type: json['type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userDataModel:
          json['user'] != null ? UserDataModel.fromJson(json['user']) : null,
      hotelDataModel:
          json['hotel'] != null ? HotelDataModel.fromJson(json['hotel']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'id': id,
      'user_id': userId,
      'hotel_id': hotelId,
      'type': type,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user': userDataModel != null ? userDataModel!.toJson() : null,
      'hotel': hotelDataModel != null ? hotelDataModel!.toJson() : null,
    };
    return json;
  }
}

class UserDataModel extends UserDataEntity {
  UserDataModel({
    int? id,
    String? name,
    String? email,
    String? image,
    String? createdAt,
    String? updatedAt,
    String? googleid,
  }) : super(
          createdAt: createdAt!,
          id: id!,
          name: name!,
          email: email!,
          image: image!,
          updatedAt: updatedAt!,
          googleid: googleid!,
        );

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      googleid: json['google_id'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'id': id,
      'name': name,
      'image': image,
      'email': email,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'google_id': googleid
    };
    return json;
  }
}
