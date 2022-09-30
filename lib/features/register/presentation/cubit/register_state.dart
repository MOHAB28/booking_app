import 'package:equatable/equatable.dart';

import '../../../login/domain/entities/login_entity.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterInit extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final AuthEntity data;
  const RegisterSuccess({required this.data});
}

class RegisterFailure extends RegisterState {}

class RegisterValidErrorState extends RegisterState {}
