import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/exctensions.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../login/domain/entities/login_entity.dart';
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
    required this.passwordConfirm,
  });
}

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase _usecase;
  RegisterCubit(
    this._usecase,
  ) : super(RegisterInitial());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController passwordComfirmController;

  String errorName = '';
  String errorEmail = '';
  String errorPassword = '';
  String errorPasswordCon = '';

  void init() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    passwordComfirmController = TextEditingController();
    errorName = '';
    errorEmail = '';
    errorPassword = '';
    errorPasswordCon = '';
    emit(RegisterInit());
  }

  bool allValidation() {
    bool isValid = true;
    if (nameController.text.trim().isEmpty ||
        nameController.text.trim().length < 4) {
      errorName = AppStrings.enterNamePls.tr();
      isValid = false;
    } else {
      errorName = '';
    }

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

    if (passwordComfirmController.text.trim().length < 6 ||
        passwordComfirmController.text.trim().isEmpty) {
      errorPasswordCon = AppStrings.enterValidPass.tr();
      isValid = false;
    } else if (passwordController.text.trim() !=
        passwordComfirmController.text.trim()) {
      errorPasswordCon = AppStrings.confirmPasswordError.tr();
      isValid = false;
    } else {
      errorPasswordCon = '';
    }
    emit(RegisterValidErrorState());
    return isValid;
  }

  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    passwordComfirmController.dispose();
    emit(state);
  }

  AuthEntity? authEntity;
  Future<void> register(RegisterInputCubit input) async {
    emit(RegisterLoading());
    final successOrFailure = await _usecase(
      RegisterUsecaseInput(
        email: input.email,
        password: input.password,
        name: input.name,
        passwordConfirm: input.passwordConfirm,
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
