import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/routes.dart';
import '../../cubit/profile/profile_cubit.dart';
import '../../../../../core/resources/values_manager.dart';

class UserPhoto extends StatefulWidget {
  const UserPhoto({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  final ProfileCubitData userProfile;

  @override
  State<UserPhoto> createState() => _UserPhotoState();
}

class _UserPhotoState extends State<UserPhoto> {
  @override
  Widget build(BuildContext context) {
    ProfileCubitData userUpdatedProfile = ProfileCubitData(
      name: widget.userProfile.name,
      email: widget.userProfile.email,
      image: widget.userProfile.image,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p15),
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            CircleAvatar(
              radius: AppSize.s70,
              backgroundImage: userUpdatedProfile.image != null? NetworkImage(userUpdatedProfile.image!) : const NetworkImage('https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png'),
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
    BlocProvider.of<ProfileCubit>(context).updateProfile(
      ProfileCubitData(
        name: widget.userProfile.name,
        email: widget.userProfile.email,
        image: file.path,
      //   image: await MultipartFile.fromFile(
      //   file.path,
      //   filename: fileName,
      // ),
      ),
    );

    // FormData data = FormData.fromMap({
    //   'name': userProfile.name,
    //   'email': userProfile.email,
    //   "image": await MultipartFile.fromFile(
    //     file.path,
    //     filename: fileName,
    //   ),
    // });

    // final response = await sl<DioHelper>().post(
    //   endPoint: updateProfileEndPoint,
    //   isMultipart: true,
    //   data: data,
    // );

    // log(response.toString());
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
