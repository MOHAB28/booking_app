import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../profile/presentation/cubit/profile/profile_cubit.dart';
import '../../../../profile/presentation/pages/profile_test_page.dart';
import '../../cubit/get_hotels_cubit.dart';
import '../screens/explore_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with TickerProviderStateMixin {
  @override
  late AnimationController animationController;
  int currentIndex = 0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    BlocProvider.of<GetHotelsCubit>(context).getHotels(1).whenComplete(
          () => BlocProvider.of<ProfileCubit>(context).getProfile(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      ExploreScreen(
        animationController: animationController,
      ),
      const ProfileTestPage(),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.search,
              size: 25,
            ),
            label: AppStrings.explore.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person,
              size: 25,
            ),
            label: AppStrings.profile.tr(),
          ),
        ],
      ),
    );
  }
}
