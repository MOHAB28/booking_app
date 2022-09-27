import 'dart:async';

import 'package:flutter/material.dart';
import 'page_pop_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeExplorerSliderView extends StatefulWidget {
  final double opValue;

  final VoidCallback click;

  const HomeExplorerSliderView(
      {Key? key, required this.opValue, required this.click})
      : super(key: key);

  @override
  State<HomeExplorerSliderView> createState() => _HomeExplorerSliderView();
}

class _HomeExplorerSliderView extends State<HomeExplorerSliderView> {
  var pageController = PageController(initialPage: 0);

  // List<PageViewData> pageViewDat = [];
  late Timer sliderTimer;
  var currentShowIndex = 0;

  @override
  void initState() {
    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted) {
        if (currentShowIndex == 0) {
          pageController.animateTo(MediaQuery.of(context).size.width,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn);
        } else {
          if (currentShowIndex == 1) {
            pageController.animateTo(MediaQuery.of(context).size.width * 2,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn);
          } else if (currentShowIndex == 2) {
            pageController.animateTo(0,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn);
          }
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            pageSnapping: true,
            onPageChanged: (index) {
              currentShowIndex = index;
            },
            scrollDirection: Axis.horizontal,
            children: [
              PagePopup(
                opValue: widget.opValue,
                assetImage: 'assets/images/hoter1.webp',
              ),
              PagePopup(
                opValue: widget.opValue,
                assetImage: 'assets/images/hotel4.webp',
              ),
              PagePopup(
                opValue: widget.opValue,
                assetImage: 'assets/images/hotel3.webp',
              ),
            ],
          ),
          Positioned(
              bottom: 32,
              right: 10,
              left: 280,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Colors.teal,
                  dotColor: Colors.white,
                  dotHeight: 11.0,
                  dotWidth: 11.0,
                  spacing: 5.0,
                ), // WormEffect
              ))
        ],
      ),
    );
  }
}
