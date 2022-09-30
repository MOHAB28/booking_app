import 'package:flutter/cupertino.dart';
import '../../features/get_hotels/presentation/pages/screens/view_all_hotels_page.dart';
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
  static const String viewAllHotelsPageKey = '/ViewAllHotelsPage';
  static Map<String, WidgetBuilder> get routes {
    return {
      profileTestPage: (context) => const ProfileTestPage(),
      layoutPage: (context) => const HomeLayout(),
      welcomeOnboardingPageKey: (context) => const WelcomeOnboardingPage(),
      onboardingPageKey: (context) => const OnboardingPage(),
      loginPageKey: (context) => const LoginPage(),
      registerPageKey: (context) => const RegisterPage(),
      searchPageKey: (context) => const SearchPage(),
      editFilterPageKey: (context) => const EditFilterPage(),
      viewAllHotelsPageKey: (context) => const ViewAllHotelsPage(),
    };
  }
}
