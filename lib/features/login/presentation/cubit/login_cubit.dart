import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/usecases/login_usecase.dart';
part 'login_state.dart';

class LoginInputCubit {
  final String email;
  final String password;
  const LoginInputCubit({
    required this.email,
    required this.password,
  });
}

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _usecase;
  LoginCubit(
    this._usecase,
  ) : super(LoginInitial());

  LoginEntity? loginEntity;
  Future<void> login(LoginInputCubit input) async {
    final successOrFailure = await _usecase(
      LoginUsecaseInput(
        email: input.email,
        password: input.password,
      ),
    );

    successOrFailure.fold(
      (failure) => emit(LoginFailure()),
      (data) {
        emit(LoginSuccess(data: data));
      },
    );
  }
}
