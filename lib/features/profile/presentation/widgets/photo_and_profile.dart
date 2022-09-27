import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../cubit/profile/profile_cubit.dart';

class NameAndPhoto extends StatelessWidget {
  final SuccessToGetProfileState state;
  const NameAndPhoto({
    required this.state,
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
              state.profile.data.name.split(' ').first,
              style: getBoldStyle(
                color: ColorManager.bBlack,
                fontSize: FontSize.s20,
              ),
            ),
            Text(
              AppStrings.viewProfile,
              style: getLightStyle(
                  color: ColorManager.gGrey, fontSize: FontSize.s16),
            ),
          ],
        ),
        // User photo
        CircleAvatar(
          backgroundColor: ColorManager.gGrey,
          radius: AppSize.s40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s40),
            child: Image.network(
              fit: BoxFit.cover,
              state.profile.data.image
              // 'https://scontent.fcai20-5.fna.fbcdn.net/v/t1.6435-9/126049659_1342762619391931_2298948717016394334_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=WA0MihzOWhcAX80cO71&tn=_TxThWWxL90AC1Km&_nc_ht=scontent.fcai20-5.fna&oh=00_AT8c1u5nBhTrSyTsQi8Q7siLJB3cXjk93PcR_n-1GZ8s0Q&oe=6354F2CB',
            ),
          ),
        ),
      ],
    );
  }
}
