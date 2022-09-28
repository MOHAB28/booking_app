part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class SuccessToGetProfileState extends ProfileState {
  final ProfileEntity profile;
  const SuccessToGetProfileState(this.profile);
  @override
  List<Object> get props => [profile];
}

class FailToGetProfileState extends ProfileState {}

class UpdataProfileLoadingState extends ProfileState {}

class UpdatingSuccessState extends ProfileState {
  final ProfileEntity profile;
  const UpdatingSuccessState(this.profile);
  @override
  List<Object> get props => [profile];
}

class ChangeProfileImageSuccessState extends ProfileState {}

class ChangeProfileImageErrorState extends ProfileState {}

class AppThemeModeState extends ProfileState {}
class AppThemeModeAgState extends ProfileState {}
