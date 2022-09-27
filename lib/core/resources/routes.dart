import 'package:flutter/cupertino.dart';
import 'package:phase3/features/profile/presentation/pages/update_profile.dart';

import '../../features/profile/presentation/pages/profile_test_page.dart';
import '../../features/get_hotels/presentation/pages/layout/home_layout.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/login/presentation/pages/onboarding/view/onboarding_page.dart';
import '../../features/login/presentation/pages/welcome_onboarding_page.dart';
import '../../features/register/presentation/pages/register_page.dart';
import '../../features/search/presentation/pages/edit_filter_page.dart';
import '../../features/search/presentation/pages/main_page/search_page.dart';

class Routes {
  static const String welcomeOnboardingPageKey = '/WelcomeOnboarding';
  static const String onboardingPageKey = '/Onboarding';
  static const String loginPageKey = '/Login';
  static const String registerPageKey = '/Register';
  static const String profileTestPage = '/profileTestPage';
  static const String updateProfilePage = '/update_profile_page';
  static const String layoutPage = '/layoutPage';
  static const String searchPageKey = '/SearchPage';
  static const String editFilterPageKey = '/EditFilterPage';
  static Map<String, WidgetBuilder> get routes {
    return {
      profileTestPage: (context) => ProfileTestPage(),
      updateProfilePage: (context) => const UpdateProfilePage(),

      layoutPage: (context) => const HomeLayout(),
      welcomeOnboardingPageKey: (context) => const WelcomeOnboardingPage(),
      onboardingPageKey: (context) => const OnboardingPage(),
      loginPageKey: (context) => const LoginPage(),
      registerPageKey: (context) => const RegisterPage(),
      searchPageKey: (context) => const SearchPage(),
      editFilterPageKey: (context) => const EditFilterPage(),
    };
  }
}
