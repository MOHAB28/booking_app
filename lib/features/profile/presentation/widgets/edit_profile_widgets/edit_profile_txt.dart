
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class EditProfileTxt extends StatelessWidget {
  const EditProfileTxt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppStrings.editProfile.tr(),
        style: getBoldStyle(
            color: ColorManager.bBlack, fontSize: FontSize.s20),
      ),
    );
  }
}