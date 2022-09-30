import '../../domain/entities/get_hotels_entities.dart';

class GetHotelsModel extends GetHotelsEntity {
  final AllHotelsDataModel? allHotelsDataModel;
  GetHotelsModel({
    String? status,
    this.allHotelsDataModel,
  }) : super(
          getAllHotelsData: allHotelsDataModel!,
          status: status!,
        );

  factory GetHotelsModel.fromJson(Map<String, dynamic> json) {
    return GetHotelsModel(
      status: json['status']['type'],
      allHotelsDataModel: json['data'] != null
          ? AllHotelsDataModel.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'status': {
        'type': status,
      },
      'data': allHotelsDataModel?.toJson(),
    };
    return json;
  }
}

class AllHotelsDataModel extends AllHotelsDataEntity {
  final List<HotelDataModel>? getHotelDataModel;
  final List<LinksDataModel>? linksDataModel;
  AllHotelsDataModel({
    int? currentPage,
    int? from,
    int? lastPage,
    int? to,
    int? total,
    String? nextPageUrl,
    String? path,
    String? perPage,
    String? lastPageUrl,
    String? firstPageUrl,
    this.getHotelDataModel,
    this.linksDataModel,
  }) : super(
          currentPage: currentPage!,
          from: from!,
          lastPage: lastPage!,
          lastPageUrl: lastPageUrl!,
          to: to!,
          total: total!,
          nextPageUrl: nextPageUrl!,
          path: path!,
          perPage: perPage!,
          firstPageUrl: firstPageUrl!,
          getHotelData: getHotelDataModel!,
          linksData: linksDataModel!,
        );

  factory AllHotelsDataModel.fromJson(Map<String, dynamic> json) {
    List<HotelDataModel> hotels = [];
    List<LinksDataModel> links = [];
    if (json['data'] != null) {
      for (var hotel in json['data']) {
        hotels.add(HotelDataModel.fromJson(hotel));
      }
    }
    if (json['links'] != null) {
      for (var link in json['links']) {
        links.add(LinksDataModel.fromJson(link));
      }
    }
    return AllHotelsDataModel(
      currentPage: json['current_page'],
      firstPageUrl: json['first_page_url'],
      from: json['from'] ?? 0,
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      getHotelDataModel: hotels,
      linksDataModel: links,
      nextPageUrl: json['next_page_url'] ?? '',
      path: json['path'],
      perPage: json['per_page'],
      to: json['to']??0,
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
      'data': getHotelDataModel?.map((hotel) => hotel.toJson()).toList(),
      'links': linksDataModel?.map((link) => link.toJson()).toList()
    };
    return json;
  }
}

class HotelDataModel extends HotelDataEntity {
  final List<HotelImagesModel>? hotelImagesModel;
  final List<HotelFacilitiesModel>? hotelFacilitiesModel;
  HotelDataModel({
    int? id,
    String? name,
    String? description,
    String? price,
    String? address,
    String? longitude,
    String? latitude,
    String? rate,
    String? createdAt,
    String? updatedAt,
    this.hotelFacilitiesModel,
    this.hotelImagesModel,
  }) : super(
          id: id!,
          rate: rate!,
          name: name!,
          description: description!,
          price: price!,
          longitude: longitude!,
          latitude: latitude!,
          createdAt: createdAt!,
          updatedAt: updatedAt!,
          address: address!,
          hotelFacilities: hotelFacilitiesModel!,
          hotelImages: hotelImagesModel!,
        );
  factory HotelDataModel.fromJson(Map<String, dynamic> json) {
    List<HotelImagesModel> images = [];
    List<HotelFacilitiesModel> facilities = [];
    if (json['hotel_images'] != null) {
      for (var image in json['hotel_images']) {
        images.add(HotelImagesModel.fromJson(image));
      }
    }
    if (json['hotel_facilities'] != null) {
      for (var facility in json['hotel_facilities']) {
        facilities.add(HotelFacilitiesModel.fromJson(facility));
      }
    }
    return HotelDataModel(
      hotelImagesModel: images,
      hotelFacilitiesModel: facilities,
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      rate: json['rate'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'address': address,
      'longitude': longitude,
      'latitude': latitude,
      'rate': rate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'hotel_images': hotelImagesModel?.map((image) => image.toJson()).toList(),
      'hotel_facilities':
          hotelFacilitiesModel?.map((facility) => facility.toJson()).toList(),
    };
    return json;
  }
}

class HotelImagesModel extends HotelImagesEntity {
  HotelImagesModel({
    int? id,
    String? hotelId,
    String? image,
  }) : super(
          hotelId: hotelId!,
          id: id!,
          image: image!,
        );
  factory HotelImagesModel.fromJson(Map<String, dynamic> json) {
    return HotelImagesModel(
      hotelId: json['hotel_id'],
      id: json['id'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'id': id,
      'hotel_id': hotelId,
      'image': image,
    };
    return json;
  }
}

class HotelFacilitiesModel extends HotelFacilitiesEntity {
  HotelFacilitiesModel({
    int? id,
    String? hotelId,
    String? facilityId,
  }) : super(
          hotelId: hotelId!,
          id: id!,
          facilityId: facilityId!,
        );
  factory HotelFacilitiesModel.fromJson(Map<String, dynamic> json) {
    return HotelFacilitiesModel(
      hotelId: json['hotel_id'],
      id: json['id'],
      facilityId: json['facility_id'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'id': id,
      'hotel_id': hotelId,
      'facility_id': facilityId,
    };
    return json;
  }
}

class LinksDataModel extends LinksDataEntity {
  LinksDataModel({
    String? url,
    String? label,
    bool? active,
  }) : super(
          active: active!,
          label: label!,
          url: url!,
        );
  factory LinksDataModel.fromJson(Map<String, dynamic> json) {
    return LinksDataModel(
      active: json['active'],
      url: json['url'] ?? '',
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'url': url,
      'label': label,
      'active': active,
    };
    return json;
  }
}
