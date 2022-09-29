import 'package:flutter/material.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/custom_button_builder.dart';
import 'package:easy_localization/easy_localization.dart';


class WelcomeOnboardingPage extends StatefulWidget {
  const WelcomeOnboardingPage({super.key});

  @override
  State<WelcomeOnboardingPage> createState() => _WelcomeOnboardingPageState();
}

class _WelcomeOnboardingPageState extends State<WelcomeOnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            ImageAssets.wOnbImage,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black26,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 1.0,
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Column(
                children: [
                  Text(
                    AppStrings.motel.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSize.s15),
                  Text(
                    AppStrings.bestHotelDeals.tr(),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const Spacer(),
                  CustomButtonBuilder(
                    title: AppStrings.getStarted.tr(),
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.onboardingPageKey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
