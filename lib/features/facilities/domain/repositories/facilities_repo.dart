import 'package:dartz/dartz.dart';
import 'package:phase3/core/error/exception.dart';

import '../entities/facilities_entity.dart';

abstract class FacilitiesRepo {
  Future<Either<PrimaryServerException, FacilitiesEntity>> getFacilities();
}
