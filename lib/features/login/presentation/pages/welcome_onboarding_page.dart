import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phase3/core/resources/assets_manager.dart';
import 'package:phase3/core/resources/strings_manager.dart';
import 'package:phase3/features/login/presentation/pages/onboarding_page.dart';
import 'package:phase3/features/login/presentation/widgets/my_button.dart';

import '../../../../core/resources/routes.dart';

class WelcomeOnBoarding extends StatelessWidget {
  const WelcomeOnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 900.0,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Image.asset(
                      ImageAssets.welcomeOnBoarding,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 80.0
                      ),
                      child: Text(
                          AppStrings.motel,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.white70.withOpacity(.9),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 780.0
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 20.0,
                          left: 20.0
                        ),
                        child: MyButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                  Routes.onBoarding
                              );
                            },
                            text: AppStrings.getStarted,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
