import 'package:flutter/cupertino.dart';
import 'package:phase3/features/login/presentation/pages/welcome_onboarding_page.dart';

import '../../features/login/presentation/pages/login_page.dart';
import '../../features/login/presentation/pages/onboarding_page.dart';
import '../../main.dart';

class Routes {
  static const String home = '/home';
  static const String welcomeBoard = '/welcomeBoard';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomePage(),
      welcomeBoard: (context) => const WelcomeOnBoarding(),
      onBoarding: (context) => const OnBoardingScreen(),
      login: (context) => const LoginScreen(),
    };
  }
}
