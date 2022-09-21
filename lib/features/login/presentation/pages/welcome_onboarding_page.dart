import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phase3/core/resources/assets_manager.dart';

class WelcomeOnBoarding extends StatelessWidget {
  const WelcomeOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Image.asset(
        ImageAssets.welcomeOnBoarding,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
