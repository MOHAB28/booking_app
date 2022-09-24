import 'package:flutter/cupertino.dart';

import '../../features/get_hotels/presentation/pages/layout/home_layout.dart';
import '../../features/get_hotels/presentation/pages/screens/explore_screen.dart';
import '../../features/get_hotels/presentation/pages/screens/profile_screen.dart';
import '../../features/profile/presentation/pages/profile_test_page.dart';
import '../../main.dart';

class Routes {
  static const String home = '/home';
  static const String profileTestPage = '/profileTestPage';
  static const String layoutPage = '/layoutPage';
  static const String explorePage = '/explorePage';
  static const String profilePage = '/profilePage';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomePage(),
      profileTestPage: (context) =>  ProfileTestPage(),
      layoutPage: (context) =>  HomeLayout(),

    };
  }
}
