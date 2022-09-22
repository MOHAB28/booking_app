import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../entities/get_hotels_entities.dart';

abstract class GetHotelsRepo {
  Future<Either<PrimaryServerException,GetHotelsEntity>> getHotels(int page);
}