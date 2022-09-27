import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../get_hotels/domain/entities/get_hotels_entities.dart';

abstract class SearchRepo {
  Future<Either<PrimaryServerException, GetHotelsEntity>> search(
    SearchInput input,
  );
}

class SearchInput {
  final String name;
  final int count;
  final int page;
  final String? address;
  final dynamic maxPrice;
  final dynamic minPrice;
  final double? latitude;
  final double? longitude;
  final dynamic distance;
  const SearchInput({
    required this.name,
    required this.count,
    required this.page,
    this.address,
    this.distance,
    this.latitude,
    this.longitude,
    this.maxPrice,
    this.minPrice,
  });
}
