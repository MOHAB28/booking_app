import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../get_hotels/domain/entities/get_hotels_entities.dart';

abstract class SearchRepo {
  Future<Either<PrimaryServerException, GetHotelsEntity>> search(
    SearchInput input,
  );
}

class SearchInput {
  final int count;
  final int page;
  final String? name;
  final Map<String, int>? facilities;
  final String? address;
  final dynamic maxPrice;
  final dynamic minPrice;
  final double? latitude;
  final double? longitude;
  final dynamic distance;
  const SearchInput({
    required this.count,
    required this.page,
    this.name,
    this.address,
    this.facilities,
    this.distance,
    this.latitude,
    this.longitude,
    this.maxPrice,
    this.minPrice,
  });
}
