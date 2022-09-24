import 'package:flutter/material.dart';

import 'explore_slider_view.dart';

class SliderDesign extends StatelessWidget {
   SliderDesign({Key? key, required this.animationController}) : super(key: key);
  late AnimationController animationController;



   @override
  Widget build(BuildContext context) {
     var sliderImageHeight = MediaQuery.of(context).size.width * 1.3;
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) {
            var opacity = 1.0 -
                (animationController.value > 0.64
                    ? 1.0
                    : animationController.value);
            return SizedBox(
                height: sliderImageHeight * (1.0 - animationController.value),
                child: HomeExplorerSliderView(
                  opValue: opacity,
                  click: () {},
                ) // Scaffold
            ); // Sized Box
          }),
    );
  }
}
