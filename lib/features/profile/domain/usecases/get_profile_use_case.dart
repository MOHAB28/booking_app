import '../../../../core/error/exception.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class GetProfileUseCase extends BaseUseCase<NoParams, ProfileEntity> {
  final ProfileRepository _repository;
  GetProfileUseCase(this._repository);

  @override
  Future<Either<PrimaryServerException, ProfileEntity>> call(NoParams input) async {
    return await _repository.getProfile();
  }
}
