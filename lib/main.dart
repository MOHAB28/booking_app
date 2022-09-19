import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/resources/routes.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

// Saba7 elfol from mo7amedy :)

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LoginCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo m.Maher',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
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
      body: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return Column(
            children: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).login(
                    const LoginInputCubit(
                      email: 'mohab15@gmail.com',
                      password: '123456',
                    ),
                  );
                },
                child: const Text('Login Button with aly'),
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state is LoginSuccess) {
            debugPrint(
                '${state.data.status} ${state.data.loginDataEntity.name}');
          }
        },
      ),
    );
  }
}
