
import 'package:equatable/equatable.dart';
import '../../domain/entities/register_entity.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterEntity data;
  const RegisterSuccess({required this.data});
}

class RegisterFailure extends RegisterState {}
