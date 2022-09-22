import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../entities/register_entity.dart';

abstract class RegisterRepo {
  Future<Either<PrimaryServerException,RegisterEntity>> register(RegisterInput input);
}

class RegisterInput {
  final String email;
  final String name;
  final String password;
  final String passwordConfirm;

  const RegisterInput({
    required this.email,
    required this.name,
    required this.passwordConfirm,
    required this.password,
  });
}