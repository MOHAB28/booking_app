import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phase3/core/resources/color_manager.dart';
import 'package:phase3/core/resources/routes.dart';
import 'package:phase3/core/resources/strings_manager.dart';
import 'package:phase3/core/resources/values_manager.dart';
import 'package:phase3/core/utils/snack_bar.dart';
import 'package:phase3/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:phase3/features/profile/presentation/pages/txt_field.dart';

import '../widgets/edit_profile_widgets/edit_profile_txt.dart';
import '../widgets/edit_profile_widgets/user_photo.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final userProfile =
        ModalRoute.of(context)!.settings.arguments as ProfileCubitData;

    var userUpdatedProfile = ProfileCubitData(
      name: userProfile.name,
      email: userProfile.email,
      image: userProfile.image,
      token: userProfile.token,
    );

    void saveForm() {
      final isValid = formKey.currentState!.validate();

      if (!isValid) {
        SnackBarUtil().getSnackBar(
          context: context,
          message: 'someThing wrong!',
          color: Colors.red,
        );
        return;
      }

      formKey.currentState!.save();
      BlocProvider.of<ProfileCubit>(context).updateProfile(userUpdatedProfile);
      Navigator.of(context).pushReplacementNamed(Routes.profileTestPage);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Edit profile
                  const EditProfileTxt(),
                  // User photo
                  UserPhoto(userProfile: userUpdatedProfile),
                  const SizedBox(height: AppSize.s20),
                  // Form fields
                  //---> name
                  EditTxtField(
                    initialValue: userProfile.name,
                    hintTxt: AppStrings.userName,
                    saveFunction: () => (newValue) {
                      userUpdatedProfile = ProfileCubitData(
                        name: newValue!,
                        email: userUpdatedProfile.email,
                        image: userUpdatedProfile.image,
                        token: userUpdatedProfile.token,
                      );
                    },
                  ),
                  const SizedBox(height: AppSize.s20),
                  // ---> E-mail
                  EditTxtField(
                    initialValue: userProfile.email,
                    hintTxt: AppStrings.email,
                    saveFunction: () => (newValue) {
                      userUpdatedProfile = ProfileCubitData(
                        name: userUpdatedProfile.name,
                        email: newValue,
                        image: userUpdatedProfile.image,
                        token: userUpdatedProfile.token,
                      );
                    },
                  ),
                  const Spacer(),
                  // Save button
                  Container(
                    height: AppSize.s60,
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: AppPadding.p8),
                    child: ElevatedButton(
                      onPressed: () => saveForm(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.bGreen,
                      ),
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
