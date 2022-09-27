import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_hotels_entities.dart';
import '../repositories/get_hotels.dart';

class GetHotelsUsecase extends BaseUseCase<int,GetHotelsEntity>{
  final GetHotelsRepo _repo;
  GetHotelsUsecase(this._repo);
  @override
  Future<Either<PrimaryServerException, GetHotelsEntity>> call(int input) async {
    return await _repo.getHotels(input);
  }
}