import 'package:binary_brains/constants/component.dart';
import 'package:binary_brains/routes/routes.dart';
import 'package:binary_brains/screens/onboard_screen.dart';
import 'package:binary_brains/screens/sign_in_screen.dart';
import 'package:binary_brains/screens/sign_up_one_screen.dart';
import 'package:binary_brains/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  SharedPreferences prefs = await SharedPreferences.getInstance();

  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);

  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Binary Brains',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      routes: PageRoutes().routes(),
      // home: const SplashScreen(),
      initialRoute: initScreen == 0 || initScreen == null
          ? OnBoardScreen.routeName
          : SplashScreen.routeName,
    );
  }
}
