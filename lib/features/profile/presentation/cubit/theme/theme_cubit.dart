import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../injection_container.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool isDark = sl<SharedPreferences>().getBool('isDark') ?? false;

  void changeThemeMode(bool value) {
    if (value == true) {
      isDark = true;
      sl<SharedPreferences>().setBool('isDark', isDark).then((value) {
        emit(DarkThemeState());
      });
    } else if (value == false) {
      isDark = false;
      sl<SharedPreferences>().setBool('isDark', isDark).then((value) {
        emit(LightThemeState());
      });
    }
  }
}
