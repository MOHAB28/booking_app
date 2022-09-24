import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/booking/presentation/cubit/booking_cubit.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'features/register/presentation/cubit/register_cubit.dart';
import 'core/resources/routes.dart';
import 'core/resources/theme_manager.dart';
import 'features/get_hotels/presentation/cubit/get_hotels_cubit.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'injection_container.dart';


String? token;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<GetHotelsCubit>()),
        BlocProvider(create: (context) => sl<LoginCubit>()),
        BlocProvider(create: (context) => sl<RegisterCubit>()),
        BlocProvider(create: (context) => sl<ProfileCubit>()),
        BlocProvider(create: (context) => sl<BookingCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo m.Maher',
        themeMode: ThemeMode.light,
        theme: getApplicationLighTheme(),
        darkTheme: getApplicationDarkTheme(),
        routes: Routes.routes,
        initialRoute: Routes.welcomeOnboardingPageKey,

      ),
    );
  }
}

