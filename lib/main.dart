import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc_obsorver.dart';
import 'core/resources/language_manager.dart';
import 'features/facilities/presentation/cubit/facilities_cubit.dart';
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
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  token = sl<SharedPreferences>().getString(isLoggedIn);
  bool? isDark = sl<SharedPreferences>().getBool('isDark');
  runApp(
    EasyLocalization(
      supportedLocales: const [
        arabicLocal,
        englishLocal,
      ],
      path: assetPathLocalisations,
      child: Phoenix(child: MyApp(isDark: isDark)),
    ),
  );
}

const String prefsKeyLang = "PREFS_KEY_LANG";

class MyApp extends StatefulWidget {
  const MyApp({Key? key, this.isDark}) : super(key: key);
  final bool? isDark;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<String> getAppLanguage() async {
    String? language = sl<SharedPreferences>().getString(prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.english.value;
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.arabic.value) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }

  @override
  void didChangeDependencies() {
    getLocal().then((local) => context.setLocale(local));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<GetHotelsCubit>()),
        BlocProvider(create: (context) => sl<LoginCubit>()),
        BlocProvider(create: (context) => sl<RegisterCubit>()),
        BlocProvider(create: (context) => sl<BookingCubit>()),
        BlocProvider(create: (context) => sl<SearchCubit>()),
        BlocProvider(create: (context) => sl<FacilitiesCubit>()..getFacilities()),
        BlocProvider(
            create: (context) =>
                sl<ProfileCubit>()..changeThemeMode(widget.isDark)),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
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
