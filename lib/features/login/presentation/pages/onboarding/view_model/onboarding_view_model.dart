import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../models/onboarding_model.dart';

abstract class BaseViewModel extends BaseViewModelInput
    with BaseViewModelOutput {}

abstract class BaseViewModelInput {
  void start();
  void dispose();
}

abstract class BaseViewModelOutput {}

class OnboardingViewModel extends BaseViewModel
    with OnboardingVieModelInput, OnboardingVieModelOutput {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  int currentIndex = 0;
  late final List<SliderObject> _list;
  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
    int nextIndex = ++currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  void onPageChanged(int index) {
    currentIndex = index;
    _postDataToView();
  }

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        _list[currentIndex],
        _list.length,
        currentIndex,
      ),
    );
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onboardingTitle1.tr(),
          AppStrings.onboardingSubTitle1.tr(),
          ImageAssets.onboarding1.tr(),
        ),
        SliderObject(
          AppStrings.onboardingTitle2.tr(),
          AppStrings.onboardingSubTitle2.tr(),
          ImageAssets.onboarding2.tr(),
        ),
        SliderObject(
          AppStrings.onboardingTitle3.tr(),
          AppStrings.onboardingSubTitle2.tr(),
          ImageAssets.onboarding3.tr(),
        ),
      ];
}

abstract class OnboardingVieModelInput {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);
  Sink get inputSliderViewObject;
}

abstract class OnboardingVieModelOutput {
  Stream<SliderViewObject> get outputSliderViewObject;
}
