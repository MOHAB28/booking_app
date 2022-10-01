import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/routes.dart';
import '../../../../../core/resources/strings_manager.dart';
import 'common_button.dart';

class ViewHotelsButton extends StatelessWidget {
  ViewHotelsButton({Key? key, required this.animationController})
      : super(key: key);

  late AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    var sliderImageHeight = MediaQuery.of(context).size.width * 1.3;

    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          var opecity = 1.0 -
              (animationController.value > 0.64
                  ? 1.0
                  : animationController.value);
          return Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: sliderImageHeight * (1.0 - animationController.value),
            child: Stack(
              children: [
                Positioned(
                  top: 390,
                  bottom: 15,
                  right: 190,
                  left: 20,
                  child: Opacity(
                    opacity: opecity,
                    child: CommonButton(
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.searchPageKey),
                      buttonTextWidget: Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, top: 8, bottom: 8),
                        // EdgeInsets.only
                        child: Text(
                          AppStrings.viewHotels.tr(),
                          style: const TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ), // Text // Padding
                    ), // CommonButton
                  ),
                ),
              ],
            ),
            // Positioned
          );
        });
  }
}
