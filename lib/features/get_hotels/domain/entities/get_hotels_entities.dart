import 'package:equatable/equatable.dart';

class GetHotelsEntity extends Equatable {
  final String status;
  final AllHotelsDataEntity getAllHotelsData;
  const GetHotelsEntity({
    required this.getAllHotelsData,
    required this.status,
  });
  @override
  List<Object?> get props => [
        status,
        getAllHotelsData,
      ];
}

class AllHotelsDataEntity extends Equatable {
  final int currentPage;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String nextPageUrl;
  final String path;
  final String lastPageUrl;
  final String perPage;
  final int to;
  final int total;
  final List<HotelDataEntity> getHotelData;
  final List<LinksDataEntity> linksData;

  const AllHotelsDataEntity({
    required this.currentPage,
    required this.firstPageUrl,
    required this.from,
    required this.lastPageUrl,
    required this.getHotelData,
    required this.lastPage,
    required this.linksData,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  @override
  List<Object?> get props => [
        currentPage,
        firstPageUrl,
        from,
        getHotelData,
        lastPage,
        linksData,
        nextPageUrl,
        path,
        perPage,
        to,
        total,
        lastPageUrl,
      ];
}

class HotelDataEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String price;
  final String address;
  final String longitude;
  final String latitude;
  final String createdAt;
  final String rate;
  final String updatedAt;
  final List<HotelImagesEntity> hotelImages;
  final List<HotelFacilitiesEntity> hotelFacilities;
  const HotelDataEntity({
    required this.address,
    required this.createdAt,
    required this.description,
    required this.rate,
    required this.hotelFacilities,
    required this.hotelImages,
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.price,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        address,
        createdAt,
        rate,
        description,
        hotelFacilities,
        hotelImages,
        id,
        latitude,
        longitude,
        name,
        price,
        updatedAt,
      ];
}

class HotelImagesEntity extends Equatable {
  final int id;
  final String hotelId;
  final String image;
  const HotelImagesEntity({
    required this.hotelId,
    required this.id,
    required this.image,
  });

  @override
  List<Object?> get props => [
        hotelId,
        id,
        image,
      ];
}

class HotelFacilitiesEntity extends Equatable {
  final int id;
  final String hotelId;
  final String facilityId;
  const HotelFacilitiesEntity({
    required this.facilityId,
    required this.hotelId,
    required this.id,
  });

  @override
  List<Object?> get props => [
        facilityId,
        hotelId,
        id,
      ];
}

class LinksDataEntity extends Equatable {
  final String url;
  final bool active;
  final String label;
  const LinksDataEntity({
    required this.active,
    required this.label,
    required this.url,
  });

  @override
  List<Object?> get props => [
        active,
        label,
        url,
      ];
}
