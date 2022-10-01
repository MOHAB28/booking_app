import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/exctensions.dart';
import '../../../../core/resources/strings_manager.dart';
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

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  late TextEditingController emailController;
  late TextEditingController passwordController;
  String errorEmail = '';
  String errorPassword = '';
    void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    errorEmail = '';
    errorPassword = '';
    emit(LoginInit());
  }
  bool allValidation() {
    bool isValid = true;
    if (emailController.text.trim().isEmpty ||
        !emailController.text.trim().isEmailValid()) {
      errorEmail = AppStrings.enterAValidEm.tr();
      isValid = false;
    } else {
      errorEmail = '';
    }

    if (passwordController.text.trim().length < 6 ||
        passwordController.text.trim().isEmpty) {
      errorPassword = AppStrings.enterValidPass.tr();
      isValid = false;
    } else {
      errorPassword = '';
    }
    emit(ValidErrorState());
    return isValid;
  }

    void dispose() {
    emailController.dispose();
    passwordController.dispose();
    errorEmail = '';
    errorPassword = '';
    emit(state);
  }

  AuthEntity? loginEntity;
  Future<void> login(LoginInputCubit input) async {
    emit(LoginLoading());
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
