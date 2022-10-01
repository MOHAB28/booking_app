import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/profile/profile_cubit.dart';
import '../../../login/presentation/widgets/custom_button_builder.dart';
import '../../../login/presentation/widgets/custom_text_field.dart';
import '../../domain/entities/profile_entity.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/edit_profile_widgets/edit_profile_txt.dart';
import 'package:easy_localization/easy_localization.dart';

class UpdateProfilePage extends StatefulWidget {
  final ProfileEntity profile;
  const UpdateProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.profile.data.name;
    _emailController.text = widget.profile.data.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var profileImage = ProfileCubit.get(context).profileImage;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Edit profile
                    const EditProfileTxt(),
                    const SizedBox(height: AppSize.s10),
                    // // User photo
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          child: Center(
                            child: CircleAvatar(
                              radius: 57,
                              backgroundImage: profileImage == null
                                  ? NetworkImage(
                                      widget.profile.data.image ==
                                              'http://api.mahmoudtaha.com/images'
                                          ? 'https://image.freepik.com/free-photo/young-beautiful-woman-casual-outfit-isolated-studio_1303-20526.jpg'
                                          : widget.profile.data.image,
                                    )
                                  : FileImage(profileImage) as ImageProvider,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          child: Center(
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () {
                                ProfileCubit.get(context, listen: false)
                                    .getProfileImage();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.s20),
                    // // Form fields
                    // //---> name
                    CustomTextFormField(
                      keyboardType: TextInputType.text,
                      padding: EdgeInsets.zero,
                      titleText: AppStrings.name.tr(),
                      controller: _nameController,
                      errorText: '',
                    ),
                    const SizedBox(height: AppSize.s10),
                    // // ---> E-mail
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      padding: EdgeInsets.zero,
                      titleText: AppStrings.urEmail.tr(),
                      controller: _emailController,
                      errorText: '',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomSheet:
          BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
        if (state is UpdatingSuccessState) {
          FlushbarHelper.createSuccess(message: 'success').show(context);
          ProfileCubit.get(context, listen: false)
              .getProfile()
              .whenComplete(() => Navigator.pop(context));
        }
      }, builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p10,
            horizontal: AppPadding.p20,
          ),
          child: state is UpdataProfileLoadingState
              ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: AppSize.s50,
                  child: const Center(child:  CircularProgressIndicator()),
                )
              : CustomButtonBuilder(
                  onTap: () {
                    ProfileCubit.get(context, listen: false).updateProfile(
                      ProfileCubitData(
                        name: _nameController.text.trim(),
                        email: _emailController.text.trim(),
                        image: ProfileCubit.get(context, listen: false)
                            .profileImage,
                      ),
                    );
                  },
                  title: AppStrings.save.tr(),
                ),
        );
      }),
    );
  }
}
