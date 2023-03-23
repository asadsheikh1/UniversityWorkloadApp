import 'dart:async';

import 'package:binary_brains/constants/constant.dart';
import 'package:binary_brains/screens/entry_point.dart';
import 'package:binary_brains/screens/sign_in_screen.dart';
import 'package:binary_brains/utils/cache.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    UserCacheData.userEmail = pref.getString('email');

    UserCacheData.userEmail == null
        ? Timer(
            const Duration(seconds: 1),
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            ),
          )
        : Timer(
            const Duration(seconds: 1),
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const EntryPoint(),
              ),
            ),
          );
  }

  @override
  void initState() {
    checkUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kGreyColor,
      body: Center(
        child: SizedBox(
          height: size.height,
          width: size.width * 0.5,
          child: Image.asset(
            'assets/images/logo.png',
            height: size.height,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
