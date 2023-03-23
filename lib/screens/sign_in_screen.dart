import 'package:binary_brains/constants/api.dart';
import 'package:binary_brains/function/notifications_function.dart';
import 'package:binary_brains/screens/home_screen.dart';
import 'package:binary_brains/screens/sign_up_one_screen.dart';
import 'package:binary_brains/utils/cache.dart';
import 'package:flutter/material.dart';
import 'package:binary_brains/components/curve_clipper.dart';
import 'package:binary_brains/constants/constant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const routeName = '/login-screen';
  static bool isChecked = true;
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool userLoggedIn = false;
  String errorMessage = '';

  bool passwordObscure = true;
  Api apis = Api();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  NotificationServices notificationServices = NotificationServices();

  checkUser() {
    UserCacheData.getCacheData();
    if (UserCacheData.userEmail != null) {
      setState(() {
        userLoggedIn = true;
        navigator();
      });
    }
  }

  navigator() {
    if (userLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  void initState() {
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.getDeviceToken().then((value) {
      print('Device Token');
      print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Form(
            key: _formKey,
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
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        scale: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                    .hasMatch(value)) {
                              return "Use the standard username format, like name@example.com";
                            } else {
                              return null;
                            }
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Email Address',
                            hintText: 'example@example.com',
                            floatingLabelStyle: TextStyle(color: kOrangeColor),
                            hintStyle: TextStyle(color: kTextColor),
                            labelStyle: TextStyle(color: kTextColor),
                            suffixIcon: Icon(
                              Icons.email,
                              color: kTextColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter a password";
                            } else if (value.length < 6) {
                              return "You've entered incorrect password";
                            } else {
                              return null;
                            }
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Password',
                            floatingLabelStyle: TextStyle(color: kOrangeColor),
                            hintStyle: TextStyle(color: kTextColor),
                            labelStyle: TextStyle(color: kTextColor),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordObscure = !passwordObscure;
                                });
                              },
                              icon: Icon(
                                passwordObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: kTextColor,
                              ),
                            ),
                          ),
                          obscureText: passwordObscure,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.center,
                          direction: Axis.horizontal,
                          spacing: 20.0,
                          runSpacing: 4.0,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.center,
                              direction: Axis.horizontal,
                              children: [
                                Checkbox(
                                  value: SignInScreen.isChecked,
                                  checkColor: kWhiteColor,
                                  fillColor:
                                      MaterialStateProperty.all(kOrangeColor),
                                  onChanged: (value) {
                                    setState(() {
                                      SignInScreen.isChecked = value!;
                                      uncachedEmail = emailController.text;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'Keep me signed in',
                                    style: kTextStyle.copyWith(
                                        color: kOrangeColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                apis.login(emailController.text,
                                    passwordController.text, context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              backgroundColor: kOrangeColor,
                            ),
                            child: Text(
                              'Sign In',
                              style: kTextStyle.copyWith(
                                fontSize: 18,
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t Have an Account? ',
                              style: kTextStyle.copyWith(
                                  color: kOrangeColor, fontSize: 14.0),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpOneScreen()));
                              },
                              child: Text(
                                'Register',
                                style: kTextStyle.copyWith(
                                    color: kOrangeColor, fontSize: 14.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
