import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/routes.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../widgets/custom_button_builder.dart';
import '../models/onboarding_model.dart';
import '../view_model/onboarding_view_model.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final OnboardingViewModel _viewModel = OnboardingViewModel();
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;
  void _blind() {
    _viewModel.start();
    _timer = Timer.periodic(
      const Duration(seconds: 4),
      (Timer timer) {
        _pageController.animateToPage(
          _viewModel.goNext(),
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      },
    );
  }

  @override
  void initState() {
    _blind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        final sliderViewObject = snapshot.data;
        if (sliderViewObject != null) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: AppSize.s1,
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p40, vertical: AppPadding.p15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: AppSize.s100),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        physics: const BouncingScrollPhysics(),
                        itemCount: sliderViewObject.numOfSlides,
                        onPageChanged: (index) =>
                            _viewModel.onPageChanged(index),
                        itemBuilder: (context, index) {
                          return OnBoardingPage(sliderViewObject.sliderObject);
                        },
                      ),
                    ),
                    const SizedBox(height: AppSize.s30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: _getProperCircle(
                              i,
                              sliderViewObject.currentIndex,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: AppSize.s20),
                    CustomButtonBuilder(
                      color: ColorManager.bGreen,
                      title: AppStrings.login.tr(),
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.loginPageKey),
                    ),
                    const SizedBox(height: AppSize.s15),
                    CustomButtonBuilder(
                      color: ColorManager.bBlack,
                      title: AppStrings.creatAccount.tr(),
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.registerPageKey),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return const SelectedCircle(true);
    } else {
      return const SelectedCircle(false);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _timer?.cancel();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(_sliderObject.image),
          const SizedBox(height: AppSize.s30),
          Text(
            _sliderObject.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSize.s15),
          Expanded(
            child: Text(
              _sliderObject.subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedCircle extends StatelessWidget {
  final bool _isActive;
  const SelectedCircle(this._isActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: AppSize.s10,
      width: AppSize.s10,
      decoration: BoxDecoration(
        color: _isActive ? ColorManager.bGreen : ColorManager.bBlack,
        shape: BoxShape.circle,
      ),
    );
  }
}
