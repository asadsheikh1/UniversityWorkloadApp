import 'package:binary_brains/constants/constant.dart';
import 'package:binary_brains/screens/entry_point.dart';
import 'package:binary_brains/screens/sign_in_screen.dart';
import 'package:binary_brains/utils/cache.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

List value = [];

String? uncachedEmail;

class Api {
  static final databaseUser = FirebaseDatabase.instance.ref('user');
  static final databaseFeedback = FirebaseDatabase.instance.ref('feedback');
  final auth = FirebaseAuth.instance;

  static setUserData({
    required String name,
    required String uid,
    required String email,
    required String interest,
    required String major,
    required String location,
  }) {
    databaseUser.child('${DateTime.now().millisecondsSinceEpoch}').set({
      'Name': name,
      'UID': uid,
      'Email': email,
      'Interest': interest,
      'Major': major,
      'Location': location,
    }).then((value) {
      Fluttertoast.showToast(
        msg: 'Registered',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: kOrangeColor,
        textColor: kWhiteColor,
        fontSize: 16.0,
      ).onError((error, stackTrace) {
        Fluttertoast.showToast(
          msg: 'Sorry, an error occured',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kRedColor,
          textColor: kWhiteColor,
          fontSize: 16.0,
        );
      });
    });
  }

  userAuth({
    required String name,
    required String password,
    required String uid,
    required String email,
    required String interest,
    required String major,
    required String location,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      pref.setString('email', email);
      setUserData(
          name: name,
          uid: uid,
          email: email,
          interest: interest,
          major: major,
          location: location);
    }).onError((error, stackTrace) {});
  }

  static setFeedbackData({
    required String feedback,
    required int rating,
  }) {
    databaseFeedback.child('${DateTime.now().millisecondsSinceEpoch}').set({
      'Feedback': feedback,
      'Rating': rating,
      'email': UserCacheData.userEmail,
    }).then((value) {
      Fluttertoast.showToast(
        msg: 'Thank you for submitting the feedback',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: kOrangeColor,
        textColor: kWhiteColor,
        fontSize: 16.0,
      );
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
        msg: 'Sorry, an error occured',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: kRedColor,
        textColor: kWhiteColor,
        fontSize: 16.0,
      );
    });
  }

  void login(
      String inputEmail, String inputPassword, BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    auth
        .signInWithEmailAndPassword(email: inputEmail, password: inputPassword)
        .then((value) {
      if (SignInScreen.isChecked) {
        pref.setString('email', inputEmail);
      } else {
        uncachedEmail = inputEmail;
      }

      // Navigating to EntryPoint
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const EntryPoint(),
        ),
      );

      // Toast
      Fluttertoast.showToast(
          msg: 'Successfully login as ${value.user!.email.toString()}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kOrangeColor,
          textColor: kWhiteColor,
          fontSize: 16.0);
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
          msg: 'Sorry, an error occured',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kRedColor,
          textColor: kWhiteColor,
          fontSize: 16.0);
    });
  }

  logout(BuildContext context) {
    auth.signOut().then(
      (value) async {
        Fluttertoast.showToast(
          msg: 'Logged out',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kOrangeColor,
          textColor: kWhiteColor,
          fontSize: 16.0,
        );

        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.clear();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
          (route) => false,
        );
      },
    );
  }
}
