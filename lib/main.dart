import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/register/presentation/cubit/register_cubit.dart';
import 'core/resources/routes.dart';
import 'core/resources/theme_manager.dart';
import 'features/get_hotels/presentation/cubit/get_hotels_cubit.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'features/register/presentation/cubit/register_state.dart';
import 'injection_container.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo m.Maher',
        themeMode: ThemeMode.light,
        theme: getApplicationLighTheme(),
        darkTheme: getApplicationDarkTheme(),
        routes: Routes.routes,
        initialRoute: Routes.profileTestPage,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Column(
            children: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<RegisterCubit>(context).register(
                    const RegisterInputCubit(
                      email: 'mohamed.maher3@gmail.com',
                      password: '123456',
                      name: 'mohamed maher3',
                      passwordConfirm: '123456',
                    ),
                  );
                },
                child: const Text('register'),
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state is RegisterSuccess) {
            debugPrint(
                '${state.data.status} ${state.data.registerDataEntity.name}');
          }
        },
      ),
    );
  }
}
