import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/profile_entity.dart';
import '../../../domain/usecases/get_profile_use_case.dart';
import '../../../domain/usecases/update_profile_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase _getProfile;
  final UpdateProfileUseCase _updateProfile;
  ProfileCubit(this._getProfile, this._updateProfile) : super(ProfileInitial());

  Future<void> getProfile(String token) async {
    emit(ProfileLoadingState());
    final response = await _getProfile(token);

    response.fold(
      (fail) => emit(FailToGetProfileState()),
      (profile) => emit(SuccessToGetProfileState(profile)),
    );
  }

  Future<void> updateProfile(ProfileCubitData data) async {
    emit(ProfileLoadingState());

    final response = await _updateProfile(
      ProfileUseCaseData(
        name: data.name,
        email: data.email,
        image: data.image,
        token: data.token,
      ),
    );

    response.fold(
      (fail) => emit(FailToGetProfileState()),
      (profile) => emit(UpdatingSuccessState(profile)),
    );
  }
}

class ProfileCubitData {
  final String name, email, image, token;

  ProfileCubitData({
    required this.name,
    required this.email,
    required this.image,
    required this.token,
  });
}
