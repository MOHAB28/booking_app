import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../injection_container.dart';
import '../../../../../main.dart';
import '../../../../login/presentation/pages/login_page.dart';
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

  static ProfileCubit get(BuildContext context, {bool listen = true}) =>
      BlocProvider.of(context, listen: listen);

  ProfileEntity? profile;
  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    final response = await _getProfile(NoParams());

    response.fold(
      (fail) => emit(FailToGetProfileState()),
      (data) {
        profile = data;
        emit(SuccessToGetProfileState(data));
      },
    );
  }

  Future<void> updateProfile(ProfileCubitData data) async {
    emit(UpdataProfileLoadingState());

    final response = await _updateProfile(
      ProfileUseCaseData(
        name: data.name,
        email: data.email,
        image: data.image,
      ),
    );

    response.fold(
      (fail) => emit(FailToGetProfileState()),
      (profile) => emit(UpdatingSuccessState(profile)),
    );
  }

  var picker = ImagePicker();
  File? profileImage;

  Future<void> getProfileImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
      debugPrint(
          'Your Profile Image: ${Uri.file(pickedImage.path).pathSegments.last}');
      emit(ChangeProfileImageSuccessState());
    } else {
      emit(ChangeProfileImageErrorState());
    }
  }

  bool isDark = false;

  void changeThemeMode([bool? isShared]) {
    if (isShared != null) {
      isDark = isShared;
    } else {
      isDark = !isDark;
      debugPrint('$isDark');
      sl<SharedPreferences>().setBool('isDark', isDark).then((value) {
        emit(AppThemeModeState());
      });
      emit(AppThemeModeAgState());
    }
  }

  Future<void> logout() async {
    token = '';
    await sl<SharedPreferences>().remove(isLoggedIn);
  }
}

class ProfileCubitData {
  final String name, email;
  final File? image;

  ProfileCubitData({
    required this.name,
    required this.email,
    this.image,
  });
}
