part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class AppModeState extends ThemeState {}

class LightThemeState extends ThemeState {}

class DarkThemeState extends ThemeState {}