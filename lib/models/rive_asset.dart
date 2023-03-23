import 'package:binary_brains/screens/home_screen.dart';
import 'package:binary_brains/screens/profile_screen.dart';
import 'package:binary_brains/screens/search_screen.dart';
import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  final Widget pagename;
  RiveAsset(this.src,
      {required this.artboard,
      required this.pagename,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    pagename: const HomeScreen(),
    artboard: 'HOME',
    stateMachineName: 'HOME_interactivity',
    title: 'Home',
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    pagename: const SearchScreen(),
    artboard: 'SEARCH',
    stateMachineName: 'SEARCH_Interactivity',
    title: 'Search',
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    pagename: const ProfileScreen(),
    artboard: 'USER',
    stateMachineName: 'USER_Interactivity',
    title: 'Profile',
  ),
];

List<RiveAsset> sideMenus = [
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    pagename: const HomeScreen(),
    artboard: 'HOME',
    stateMachineName: 'HOME_interactivity',
    title: 'Home',
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    pagename: const SearchScreen(),
    artboard: 'SEARCH',
    stateMachineName: 'SEARCH_Interactivity',
    title: 'Search',
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    pagename: const ProfileScreen(),
    artboard: 'USER',
    stateMachineName: 'USER_Interactivity',
    title: 'Profile',
  ),
];

List<RiveAsset> sideMenus2 = [
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    pagename: const HomeScreen(),
    artboard: 'TIMER',
    stateMachineName: 'TIMER_Interactivity',
    title: 'History',
  ),
  RiveAsset(
    'assets/RiveAssets/icons.riv',
    pagename: const HomeScreen(),
    artboard: 'BELL',
    stateMachineName: 'BELL_Interactivity',
    title: 'Notifications',
  ),
];
