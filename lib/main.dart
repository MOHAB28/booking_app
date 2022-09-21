import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/resources/routes.dart';
import 'core/resources/theme_manager.dart';
import 'features/get_hotels/presentation/cubit/get_hotels_cubit.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
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
        BlocProvider(create: (context) => sl<LoginCubit>()),
        BlocProvider(create: (context) => sl<GetHotelsCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo m.Maher',
        themeMode: ThemeMode.light,
        theme: getApplicationLighTheme(),
        darkTheme: getApplicationDarkTheme(),
        routes: Routes.routes,
        initialRoute: Routes.home,
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
      body: BlocConsumer<GetHotelsCubit, GetHotelsState>(
        builder: (context, state) {
          return Column(
            children: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<GetHotelsCubit>(context).getHotels(
                    1
                  );
                },
                child: const Text('mohab'),
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state is GethotelsLoaded) {
            debugPrint(
                '${state.data.status} ${state.data.getAllHotelsData.linksData}');
          }
        },
      ),
    );
  }
}
