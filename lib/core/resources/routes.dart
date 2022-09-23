import 'package:flutter/cupertino.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/login/presentation/pages/onboarding/view/onboarding_page.dart';
import '../../features/login/presentation/pages/welcome_onboarding_page.dart';
import '../../features/register/presentation/pages/register_page.dart';

class Routes {
  static const String welcomeOnboardingPageKey = '/WelcomeOnboarding';
  static const String onboardingPageKey = '/Onboarding';
  static const String loginPageKey = '/Login';
  static const String registerPageKey = '/Register';

  static Map<String, WidgetBuilder> get routes {
    return {
      welcomeOnboardingPageKey: (context) => const WelcomeOnboardingPage(),
      onboardingPageKey: (context) => const OnboardingPage(),
      loginPageKey: (context) => const LoginPage(),
      registerPageKey: (context) => const RegisterPage(),
    };
  }
}
