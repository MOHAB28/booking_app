import 'package:flutter/cupertino.dart';

import '../../features/profile/presentation/pages/profile_test_page.dart';
import '../../main.dart';

class Routes {
  static const String home = '/home';
  static const String profileTestPage = '/profileTestPage';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomePage(),
      profileTestPage: (context) =>  ProfileTestPage(),
    };
  }
}
