import 'package:binary_brains/screens/about_screen.dart';
import 'package:binary_brains/screens/home_screen.dart';
import 'package:binary_brains/screens/onboard_screen.dart';
import 'package:binary_brains/screens/profile_screen.dart';
import 'package:binary_brains/screens/search_screen.dart';
import 'package:binary_brains/screens/settings_screen.dart';
import 'package:binary_brains/screens/sign_in_screen.dart';
import 'package:binary_brains/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  Map<String, WidgetBuilder> routes() {
    return {
      // SideDrawer.routeName: (context) => const SideDrawer(),
      OnBoardScreen.routeName: (context) => const OnBoardScreen(),
      SplashScreen.routeName: (context) => const SplashScreen(),
      HomeScreen.routeName: (context) => const HomeScreen(),
      ProfileScreen.routeName: (context) => const ProfileScreen(),
      SearchScreen.routeName: (context) => const SearchScreen(),
      SignInScreen.routeName: (context) => const SignInScreen(),
      SettingsScreen.routeName: (context) => const SettingsScreen(),
      AboutScreen.routeName: (context) => const AboutScreen(),
      // SignUpOneScreen.routeName: (context) => const SignUpOneSc÷reen(),
      // SignUpTwoScreen.routeName: (context) => const SignUpTwoScreen(),
      // SignUpThreeScreen.routeName: (context) => const SignUpThreeScreen(),
      // SignUpFourScreen.routeName: (context) => const SignUpFourScreen(),
      // SignUpFiveScreen.routeName: (context) => const SignUpFiveScreen(),
    };
  }
}
