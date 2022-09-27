import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator.dart';
import '../widgets/change_language.dart';
import '../widgets/column_item.dart';
import '../widgets/contact_us.dart';
import '../../../../core/resources/values_manager.dart';
import '../cubit/profile/profile_cubit.dart';
import '../widgets/dark_mode_switch.dart';
import '../widgets/edit_profile.dart';
import '../widgets/photo_and_profile.dart';

class ProfileTestPage extends StatelessWidget {
  ProfileTestPage({super.key});
  
  

  final ProfileCubitData data = ProfileCubitData(
    name: 'mohamed',
    email: 'mohamed@gmail.com',
    image: 'mohamed.png',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: BlocProvider.of<ProfileCubit>(context).getProfile(),
        builder: (context, snapshot) => BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return const LoadingIndicator();
            } else if (state is SuccessToGetProfileState) {
              final ProfileCubitData profileData = ProfileCubitData(
                name: state.profile.data.name,
                email: state.profile.data.email,
                image: state.profile.data.image,
              );
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p50,
                  horizontal: AppPadding.p20,
                ),
                child: Column(
                  children: [
                    NameAndPhoto(state: state),
                    const SizedBox(height: AppSize.s10),
                    // Edit profile
                    ColumnItem(
                        itemText: AppStrings.editProfile,
                        itemWidget: EditProfileWidget(profile: profileData)),
                    // change language
                    const ColumnItem(
                        itemText: AppStrings.changeLanguage,
                        itemWidget: ChangeLanguage()),
                    // Contact us
                    const ColumnItem(
                        itemText: AppStrings.contactUs,
                        itemWidget: ContactUs()),
                    // Dark mode switch
                    const ColumnItem(
                        itemText: AppStrings.darkMode,
                        itemWidget: DarkModeSwitch()),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
