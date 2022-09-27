import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/profile_entity.dart';
import '../../../domain/usecases/get_profile_use_case.dart';
import '../../../domain/usecases/update_profile_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase _getProfile;
  final UpdateProfileUseCase _updateProfile;
  ProfileCubit(
    this._getProfile,
    this._updateProfile,
  ) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    final response = await _getProfile(NoParams());

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
        image: data.image ,
      ),
    );

    response.fold(
      (fail) => emit(FailToGetProfileState()),
      (profile) => emit(UpdatingSuccessState(profile)),
    );
  }
}

class ProfileCubitData {
  final String name, email;
  final String? image;

  ProfileCubitData({
    required this.name,
    required this.email,
    this.image,
  });
}
