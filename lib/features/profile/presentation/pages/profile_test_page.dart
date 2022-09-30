import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator.dart';
import '../widgets/change_language.dart';
import '../widgets/column_item.dart';
import '../widgets/contact_us.dart';
import '../../../../core/resources/values_manager.dart';
import '../cubit/profile/profile_cubit.dart';
import '../widgets/photo_and_profile.dart';
import 'update_profile.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileTestPage extends StatelessWidget {
  const ProfileTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var profile = ProfileCubit.get(context).profile;
        var cubit = ProfileCubit.get(context, listen: false);
        bool isDark = ProfileCubit.get(context).isDark;
        if (profile != null) {
          return RefreshIndicator(
            onRefresh: () async {
              await ProfileCubit.get(context).getProfile();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p50,
                horizontal: AppPadding.p20,
              ),
              child: Column(
                children: [
                  NameAndPhoto(profile: profile),
                  const SizedBox(height: AppSize.s10),
                  // Edit profile
                  ColumnItem(
                    itemText: AppStrings.editProfile.tr(),
                    itemWidget: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => UpdateProfilePage(
                            profile: profile,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // change language
                  ColumnItem(
                    itemText: AppStrings.changeLanguage.tr(),
                    itemWidget: ChangeLanguage(context: context),
                  ),
                  // Contact us
                  ColumnItem(
                    itemText: AppStrings.contactUs.tr(),
                    itemWidget: const ContactUs(),
                  ),
                  // Dark mode switch
                  ColumnItem(
                    itemText: AppStrings.darkMode.tr(),
                    itemWidget: IconButton(
                      onPressed: () {
                        cubit.changeThemeMode();
                      },
                      icon: isDark
                          ? const Icon(Icons.light_mode)
                          : const Icon(Icons.dark_mode),
                    ),
                  ),
                  ColumnItem(
                    itemText: AppStrings.logout.tr(),
                    itemWidget: IconButton(
                      onPressed: () {
                        cubit.logout().whenComplete(
                              () => Navigator.pushReplacementNamed(
                                context,
                                Routes.loginPageKey,
                              ),
                            );
                      },
                      icon: const Icon(Icons.logout),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
