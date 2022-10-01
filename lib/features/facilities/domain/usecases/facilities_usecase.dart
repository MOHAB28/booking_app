import '../../../../core/error/exception.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/facilities_entity.dart';
import '../repositories/facilities_repo.dart';

class FacilitiesUsecase extends BaseUseCase<NoParams, FacilitiesEntity> {
  final FacilitiesRepo _repo;
  FacilitiesUsecase(this._repo);

  @override
  Future<Either<PrimaryServerException, FacilitiesEntity>> call(
      NoParams input) async {
    return await _repo.getFacilities();
  }
}
