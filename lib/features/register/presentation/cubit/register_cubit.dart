import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/usecases/register_usecase.dart';
import 'register_state.dart';


class RegisterInputCubit {
  final String email;
  final String name;
  final String passwordConfirm;
  final String password;
  const RegisterInputCubit({
    required this.email,
    required this.password,
    required this.name,
    required this.passwordConfirm
  });
}

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase _usecase;
  RegisterCubit(
    this._usecase,
  ) : super(RegisterInitial());

  RegisterEntity? registerEntity;
  Future<void> register(RegisterInputCubit input) async {
    final successOrFailure = await _usecase(
      RegisterUsecaseInput(
        email: input.email,
        password: input.password,
        name: input.name,
        passwordConfirm:input.passwordConfirm,
      ),
    );

    successOrFailure.fold(
      (failure) => emit(RegisterFailure()),
      (data) {
        emit(RegisterSuccess(data: data));
      },
    );
  }
}
