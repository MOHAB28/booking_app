import '../../domain/entities/facilities_entity.dart';

class FacilitiesModel extends FacilitiesEntity {
  final List<FacilitiesDataModel>? facilitiesM;
  FacilitiesModel({this.facilitiesM}) : super(facilities: facilitiesM!);
  factory FacilitiesModel.fromJson(Map<String, dynamic> json) {
    List<FacilitiesDataModel> facs = [];
    if (json['data'] != null) {
      for (var fac in json['data']) {
        facs.add(FacilitiesDataModel.fromJson(fac));
      }
    }
    return FacilitiesModel(
      facilitiesM: facs,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
'data' : facilitiesM != null? facilitiesM!.map((e) => e.toJson()).toList() : null,
    };
    return json;
  }
}

class FacilitiesDataModel extends FacilitiesDataEntity {
  FacilitiesDataModel({
    int? id,
    String? image,
    String? name,
  }) : super(
          id: id!,
          image: image!,
          name: name!,
        );

  factory FacilitiesDataModel.fromJson(Map<String, dynamic> json) {
    return FacilitiesDataModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'id': id,
      'name': name,
      'image': image,
    };
    return json;
  }
}
