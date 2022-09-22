import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/register_entity.dart';
import '../repositories/register_repo.dart';

class RegisterUsecase extends BaseUseCase<RegisterUsecaseInput, RegisterEntity> {
  final RegisterRepo _repo;
  RegisterUsecase(this._repo);
  @override
  Future<Either<PrimaryServerException, RegisterEntity>> call(
      RegisterUsecaseInput input) {
    return _repo.register(
      RegisterInput(
        email: input.email,
        password: input.password,
        name: input.name,
        passwordConfirm: input.passwordConfirm,
      ),
    );
  }
}

class RegisterUsecaseInput {
  final String email;
  final String name;
  final String password;
  final String passwordConfirm;


  const RegisterUsecaseInput({
    required this.email,
    required this.password,
    required this.name,
    required this.passwordConfirm,
  });
}
