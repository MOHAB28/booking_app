import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc_obsorver.dart';
import 'features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/booking/presentation/cubit/booking_cubit.dart';
import 'features/register/presentation/cubit/register_cubit.dart';
import 'core/resources/routes.dart';
import 'core/resources/theme_manager.dart';
import 'features/get_hotels/presentation/cubit/get_hotels_cubit.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/search/presentation/cubit/search_cubit.dart';
import 'injection_container.dart';

String? token;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  Bloc.observer = MyBlocObserver();
  token = sl<SharedPreferences>().getString(isLoggedIn);
  bool? isDark = sl<SharedPreferences>().getBool('isDark');
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.isDark}) : super(key: key);
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<GetHotelsCubit>()),
        BlocProvider(create: (context) => sl<LoginCubit>()),
        BlocProvider(create: (context) => sl<RegisterCubit>()),
        BlocProvider(create: (context) => sl<BookingCubit>()),
        BlocProvider(create: (context) => sl<SearchCubit>()),
        BlocProvider(
            create: (context) => sl<ProfileCubit>()..changeThemeMode(isDark)),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Booking app Team 15',
            themeMode: ProfileCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: getApplicationLighTheme(),
            darkTheme: getApplicationDarkTheme(),
            routes: Routes.routes,
            initialRoute: token != null
                ? Routes.layoutPage
                : Routes.welcomeOnboardingPageKey,
          );
        },
      ),
    );
  }
}
