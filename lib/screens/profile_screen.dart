import 'package:binary_brains/components/curve_clipper.dart';
import 'package:binary_brains/screens/settings_screen.dart';
import 'package:binary_brains/screens/sign_in_screen.dart';
import 'package:binary_brains/utils/cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:binary_brains/constants/constant.dart';
import 'package:binary_brains/constants/api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List emptyList = [];
  TextEditingController feedbackController = TextEditingController();
  int feedback_rating = 0;

  @override
  void initState() {
    UserCacheData.getCacheData();
    super.initState();
  }

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
                    right: 10,
                    child: Tooltip(
                      message: 'Settings',
                      child: CircleAvatar(
                        backgroundColor: kWhiteColor,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              SettingsScreen.routeName,
                            );
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.gear,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    child: Container(
                      clipBehavior: Clip.none,
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.8),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/profile.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100.0),
                        ),
                        border: Border.all(
                          color: kWhiteColor,
                          width: 6.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(1, 4),
                            blurRadius: 2,
                            color: kTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 30,
                child: FirebaseAnimatedList(
                  query: Api.databaseUser,
                  itemBuilder: (context, snapshot, animation, index) {
                    if (snapshot.child('Email').value.toString() ==
                            UserCacheData.userEmail ||
                        uncachedEmail ==
                            snapshot.child('Email').value.toString()) {
                      return Center(
                        child: Text(
                          snapshot.child('Name').value.toString(),
                          style: kTextStyle.copyWith(fontSize: 24),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
              SizedBox(
                height: 30,
                child: FirebaseAnimatedList(
                  query: Api.databaseUser,
                  itemBuilder: (context, snapshot, animation, index) {
                    if (snapshot.child('Email').value.toString() ==
                            UserCacheData.userEmail ||
                        uncachedEmail ==
                            snapshot.child('Email').value.toString()) {
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              snapshot.child('UID').value.toString(),
                              style: kTextStyle.copyWith(
                                color: kTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              snapshot.child('Email').value.toString(),
                              style: kTextStyle.copyWith(
                                color: kTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Welcome!',
                style: kTextStyle.copyWith(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kLightTextColor,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'There are a bunch of student apps that help make the learning experience smooth for the learners. Binary Brains is one such app that helps students to access to other students.',
                        style: kTextStyle.copyWith(
                          color: kTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                color: kLightTextColor,
              ),
              Text(
                'Give us your feedback!',
                style: kTextStyle.copyWith(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kLightTextColor,
                  ),
                  child: TextField(
                    controller: feedbackController,
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      fillColor: kLightTextColor,
                      hintText: 'What do you like most about our work?',
                      hintStyle: const TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                    maxLines: 4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: EmojiFeedback(
                  labelTextStyle:
                      kTextStyle.copyWith(fontWeight: FontWeight.normal),
                  animDuration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn,
                  inactiveElementScale: .5,
                  onChanged: (value) {
                    setState(() {
                      feedback_rating = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Api.setFeedbackData(
                        feedback: feedbackController.text,
                        rating: feedback_rating,
                      );

                      feedbackController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      backgroundColor: kBlueColor,
                    ),
                    child: Text(
                      'Submit',
                      style:
                          kTextStyle.copyWith(fontSize: 18, color: kWhiteColor),
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
