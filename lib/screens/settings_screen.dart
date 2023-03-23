import 'package:binary_brains/components/curve_clipper.dart';
import 'package:binary_brains/constants/api.dart';
import 'package:binary_brains/screens/about_screen.dart';
import 'package:binary_brains/screens/entry_point.dart';
import 'package:binary_brains/screens/sign_in_screen.dart';
import 'package:binary_brains/utils/cache.dart';
import 'package:flutter/material.dart';
import 'package:binary_brains/constants/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const routeName = '/settings-screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      color: const Color(0XFFED9121),
                      height: 100.0,
                    ),
                  ),
                  ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      color: const Color(0XFFFFA836),
                      height: 70.0,
                    ),
                  ),
                  ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      color: const Color(0XFFFF8C00),
                      height: 40.0,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Tooltip(
                      message: 'Back',
                      child: CircleAvatar(
                        backgroundColor: kWhiteColor,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Manage your binary brains!',
                style: kTextStyle.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EntryPoint(),
                      ),
                      (route) => false,
                    );
                  },
                  child: ListTile(
                    tileColor: kLightTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    title: Text(
                      'Go to Home',
                      style: kTextStyle.copyWith(
                        color: kTextColor,
                      ),
                    ),
                    leading: FaIcon(
                      FontAwesomeIcons.house,
                      color: kTextColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AboutScreen.routeName);
                  },
                  child: ListTile(
                    tileColor: kLightTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    title: Text(
                      'About',
                      style: kTextStyle.copyWith(
                        color: kTextColor,
                      ),
                    ),
                    leading: FaIcon(
                      FontAwesomeIcons.circleInfo,
                      color: kTextColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            icon: FaIcon(FontAwesomeIcons.rightFromBracket),
                            title: const Text('Logout?'),
                            content:
                                const Text('Are you sure you want to logout?'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Api().logout(context);
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        });
                  },
                  child: ListTile(
                    tileColor: kLightTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    title: Text(
                      'Logout',
                      style: kTextStyle.copyWith(
                        color: kTextColor,
                      ),
                    ),
                    leading: FaIcon(
                      FontAwesomeIcons.rightFromBracket,
                      color: kTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
