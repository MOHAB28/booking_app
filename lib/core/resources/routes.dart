import 'package:flutter/cupertino.dart';


import '../../features/get_hotels/presentation/pages/layout/home_layout.dart';
import '../../features/get_hotels/presentation/pages/screens/explore_screen.dart';
import '../../features/get_hotels/presentation/pages/screens/profile_screen.dart';

import '../../features/login/presentation/pages/login_page.dart';
import '../../features/login/presentation/pages/onboarding/view/onboarding_page.dart';
import '../../features/login/presentation/pages/welcome_onboarding_page.dart';
import '../../features/register/presentation/pages/register_page.dart';

import '../../features/profile/presentation/pages/profile_test_page.dart';

class Routes {
  static const String welcomeOnboardingPageKey = '/WelcomeOnboarding';
  static const String onboardingPageKey = '/Onboarding';
  static const String loginPageKey = '/Login';
  static const String registerPageKey = '/Register';
  static const String profileTestPage = '/profileTestPage';
  static const String layoutPage = '/layoutPage';
  static const String explorePage = '/explorePage';
  static const String profilePage = '/profilePage';

  static Map<String, WidgetBuilder> get routes {
    return {

      profileTestPage: (context) =>  ProfileTestPage(),
      layoutPage: (context) =>  HomeLayout(),


      welcomeOnboardingPageKey: (context) => const WelcomeOnboardingPage(),
      onboardingPageKey: (context) => const OnboardingPage(),
      loginPageKey: (context) => const LoginPage(),
      registerPageKey: (context) => const RegisterPage(),
      profileTestPage: (context) => ProfileTestPage(),

    };
  }
}
