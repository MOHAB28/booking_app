import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.sWhite,
    // app bar theme
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: false,
      backgroundColor: ColorManager.sWhite,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: AppSize.s0,
      titleTextStyle: getMediumStyle(
        fontSize: FontSize.s18,
        color: Colors.black, // It will be changed
        // color: ColorManager.black,
      ),
    ),

    iconTheme: const IconThemeData(
      color: Colors.black,
    ),

    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black,
      textColor: Colors.black,
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorManager.sWhite,
    ),
    //BottomNavigationBarTheme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      // backgroundColor: ColorManager.bottomNavColor,
      elevation: AppSize.s0,
      unselectedLabelStyle: TextStyle(fontSize: FontSize.s0),
      selectedLabelStyle: TextStyle(fontSize: FontSize.s0),
      type: BottomNavigationBarType.fixed,
    ),

    // _______/ It will be updated \_________________________
    // textTheme: TextTheme(
    //   titleLarge: getBoldStyle(
    //     fontSize: FontSize.s20,
    //     color: ColorManager.black,
    //   ),
    //   // -- newsCardtitleTextStyle --
    //   titleMedium: getBoldStyle(
    //     color: Colors.black,
    //     fontSize: FontSize.s16,
    //   ),
    //   // const -- popularCardTitleTextStyle --
    //   titleSmall: getLightStyle(
    //     color: Colors.white,
    //     fontSize: FontSize.s16,
    //   ),
    //   bodyLarge: getMediumStyle(
    //     color: Colors.black,
    //     fontSize: FontSize.s16,
    //   ),
    //   //const -- newsCardtitleTextStyle --
    //   bodyMedium: getMediumStyle(
    //     color: Colors.grey,
    //     fontSize: FontSize.s12,
    //   ),
    //   // const -- popularCardDateTextStyle --
    //   bodySmall: getLightStyle(
    //     color: Colors.white,
    //     fontSize: FontSize.s12,
    //   ),
    // ),
    // input decoration theme (text form field)
    // inputDecorationTheme:  InputDecorationTheme(
        //   // content padding
        //   contentPadding: const EdgeInsets.all(AppPadding.p8),
        //   // hint style
        //   hintStyle: getRegularStyle(
        //       color: ColorManager.lightGrey, fontSize: FontSize.s14),
        //   labelStyle:
        //       getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
        //   errorStyle: getRegularStyle(color: ColorManager.error),

        //   // enabled border style
        //   enabledBorder: const OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5),
        //   ),

        //   // focused border style
        //   focusedBorder: const OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5),
        //   ),

        //   // error border style
        //   errorBorder: const OutlineInputBorder(
        //     borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        //   ),
        //   // focused border style
        //   focusedErrorBorder: const OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5),
        //   ),
        //   // label style
        // ),
  );
}

ThemeData getApplicationDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.sBlack,
    // app bar theme
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: false,
      backgroundColor: ColorManager.sBlack,
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: AppSize.s0,
      titleTextStyle: getMediumStyle(
        fontSize: FontSize.s18,
         color: Colors.white, // It will be changed
        // color: ColorManager.white,
      ),
    ),

    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
      textColor: Colors.white,
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorManager.sBlack,
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

    // textTheme: TextTheme(
    //   titleLarge: getBoldStyle(
    //     fontSize: FontSize.s20,
    //     color: ColorManager.white,
    //   ),
    //   // -- newsCardtitleTextStyle --
    //   titleMedium: getBoldStyle(
    //     color: Colors.white,
    //     fontSize: FontSize.s16,
    //   ),
    //   // const -- popularCardTitleTextStyle --
    //   titleSmall: getLightStyle(
    //     color: Colors.white,
    //     fontSize: FontSize.s16,
    //   ),
    //    bodyLarge: getMediumStyle(
    //     color: Colors.white,
    //     fontSize: FontSize.s16,
    //   ),
    //   //const -- newsCardtitleTextStyle --
    //   bodyMedium: getMediumStyle(
    //     color: Colors.grey,
    //     fontSize: FontSize.s12,
    //   ),
    //   // const -- popularCardDateTextStyle --
    //   bodySmall: getLightStyle(
    //     color: Colors.white,
    //     fontSize: FontSize.s12,
    //   ),
    // ),

    // // input decoration theme (text form field)
    // inputDecorationTheme: InputDecorationTheme(
    //   // content padding
    //   contentPadding: const EdgeInsets.all(AppPadding.p8),
    //   // hint style
    //   hintStyle: getRegularStyle(
    //       color: ColorManager.lightGrey, fontSize: FontSize.s14),
    //   labelStyle:
    //       getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
    //   errorStyle: getRegularStyle(color: ColorManager.error),

    //   // enabled border style
    //   enabledBorder: const OutlineInputBorder(
    //     borderSide: BorderSide(color: ColorManager.white, width: AppSize.s1_5),
    //   ),

    //   // focused border style
    //   focusedBorder: const OutlineInputBorder(
    //     borderSide: BorderSide(color: ColorManager.white, width: AppSize.s1_5),
    //   ),

    //   // error border style
    //   errorBorder: const OutlineInputBorder(
    //     borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
    //   ),
    //   // focused border style
    //   focusedErrorBorder: const OutlineInputBorder(
    //     borderSide: BorderSide(color: ColorManager.white, width: AppSize.s1_5),
    //   ),
    //   // label style
    // ),
  );
}
