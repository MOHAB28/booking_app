import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/theme/theme_cubit.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: BlocProvider.of<ThemeCubit>(context).isDark,
        onChanged: (value) =>
            BlocProvider.of<ThemeCubit>(context).changeThemeMode(value));
  }
}
