import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phase3/features/get_hotels/presentation/cubit/get_hotels_cubit.dart';

import '../screens/explore_screen.dart';
import '../screens/profile_screen.dart';

class HomeLayout extends StatefulWidget {


   HomeLayout({Key? key,}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with TickerProviderStateMixin {
  @override

late AnimationController animationController;
  int currentIndex = 0;

  void initState ( ) {
    animationController = AnimationController(duration: const Duration(milliseconds: 400) , vsync: this);
    BlocProvider.of<GetHotelsCubit>(context).getHotels(1);
    super.initState();

  }



  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      ExploreScreen(animationController: animationController,),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          color: Colors.teal
        ),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle:const TextStyle(
            color: Colors.grey
        ),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index){
          setState((){
            currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(icon:Icon( Icons.search , size: 25,) , label: 'Explore' ,),
          const BottomNavigationBarItem(icon:Icon( Icons.person , size: 25,) , label: 'Profile'),
        ],
      ),
    );
  }
}
