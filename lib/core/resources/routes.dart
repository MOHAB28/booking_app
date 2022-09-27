import 'package:flutter/cupertino.dart';
import 'package:phase3/features/profile/presentation/pages/update_profile.dart';

import '../../features/profile/presentation/pages/profile_test_page.dart';
import '../../main.dart';

class Routes {
  static const String home = '/home';
  static const String profileTestPage = '/profileTestPage';
  static const String updateProfilePage = '/update_profile_page';
  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomePage(),
      profileTestPage: (context) => ProfileTestPage(),
      updateProfilePage: (context) => const UpdateProfilePage(),
    };
  }
}
