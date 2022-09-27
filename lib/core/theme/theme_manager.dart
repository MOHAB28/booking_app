import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../injection_container.dart';

class ThemeManager {
  late ThemeMode theme;

  ThemeMode call() {
    final state = sl<SharedPreferences>().getBool('isDark');
    if (state == true) {
      theme = ThemeMode.dark;
    } else {
      theme = ThemeMode.light;
    }
    return theme;
  }
}
