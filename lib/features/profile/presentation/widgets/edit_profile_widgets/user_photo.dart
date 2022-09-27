import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phase3/core/network/dio_helper.dart';
import 'package:phase3/core/resources/color_manager.dart';
import 'package:phase3/core/resources/routes.dart';
import 'package:phase3/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/network/end_points.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../injection_container.dart';

class UserPhoto extends StatelessWidget {
  const  UserPhoto({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  final ProfileCubitData userProfile;
  

  @override
  Widget build(BuildContext context) {
    ProfileCubitData userUpdatedProfile = ProfileCubitData(
      name: userProfile.name,
      email: userProfile.email,
      image: userProfile.image,
      token: userProfile.token,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p15),
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            CircleAvatar(
              radius: AppSize.s70,
              backgroundImage: NetworkImage(userUpdatedProfile.image),
            ),
            Positioned(
              right: AppSize.s10,
              bottom: AppSize.s10,
              child: CircleAvatar(
                backgroundColor: ColorManager.bGreen,
                radius: AppSize.s18,
                child: IconButton(
                  onPressed: () async => await getImage().then(
                    (_) => Navigator.of(context).pushNamed(
                        Routes.updateProfilePage,
                        arguments: userUpdatedProfile),
                  ),
                  icon: const Icon(
                    Icons.camera_alt,
                    color: ColorManager.bBlack,
                    size: AppSize.s18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Upload photo
  void uploadImage(File file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      'name': userProfile.name,
      'email': userProfile.email,
      "image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    final response = await sl<DioHelper>().post(
        endPoint: updateProfileEndPoint,
        isMultipart: true,
        data: data,
        token: userProfile.token);

    log(response.toString());
  }

  // Get photo from gallery
  Future getImage() async {
    File image;
    final picker = ImagePicker();
    var pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: AppInts.i50,
      maxHeight: AppSize.s500,
      maxWidth: AppSize.s500,
    );

    if (pickedImage != null) {
      image = File(pickedImage.path);
      uploadImage(image);
    } else {
      return;
    }
  }
}
