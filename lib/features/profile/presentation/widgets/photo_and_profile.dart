import 'package:flutter/material.dart';
import '../../domain/entities/profile_entity.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';


class NameAndPhoto extends StatelessWidget {
  final ProfileEntity profile;
  const NameAndPhoto({
    required this.profile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // User name
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profile.data.name.split(' ').first,
              style: Theme.of(context).textTheme.titleLarge
            ),
            Text(
              AppStrings.viewProfile.tr(),
              style: getLightStyle(
                  color: ColorManager.gGrey, fontSize: FontSize.s16),
            ),
          ],
        ),
        // User photo
        CircleAvatar(
          backgroundColor: ColorManager.gGrey,
          radius: AppSize.s40,
          backgroundImage: NetworkImage(
            profile.data.image == 'http://api.mahmoudtaha.com/images'
                ? 'https://image.freepik.com/free-photo/young-beautiful-woman-casual-outfit-isolated-studio_1303-20526.jpg'
                : profile.data.image,
          ),
        ),
      ],
    );
  }
}
