import 'package:flutter/cupertino.dart';

import '../../main.dart';

class Routes {
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomePage(),
    };
  }
}
