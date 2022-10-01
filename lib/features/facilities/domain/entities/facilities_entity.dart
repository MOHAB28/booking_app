import 'package:equatable/equatable.dart';

class FacilitiesEntity extends Equatable {
  final List<FacilitiesDataEntity> facilities;
  const FacilitiesEntity({required this.facilities});

  @override
  List<Object?> get props => [facilities];
}

class FacilitiesDataEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  const FacilitiesDataEntity({
    required this.id,
    required this.image,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
