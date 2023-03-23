import 'package:binary_brains/components/curve_clipper.dart';
import 'package:binary_brains/constants/api.dart';
import 'package:binary_brains/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:binary_brains/constants/constant.dart';

class SignUpFiveScreen extends StatefulWidget {
  final String name;
  final String interest;
  final String major;
  final String location;
  final String uid;

  const SignUpFiveScreen({
    super.key,
    required this.interest,
    required this.major,
    required this.location,
    required this.name,
    required this.uid,
  });
  static const routeName = '/sign-up-five-screen';

  @override
  State<SignUpFiveScreen> createState() => _SignUpFiveScreenState();
}

class _SignUpFiveScreenState extends State<SignUpFiveScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Api apis = Api();
  bool passwordObscure = true;

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
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
                        color: const Color(0XFFFEBA4F),
                        height: 130.0,
                      ),
                    ),
                    ClipPath(
                      clipper: CurveClipper(),
                      child: Container(
                        color: const Color(0XFFFF9F00),
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
                  child: Text(
                    'Enter your email',
                    style: kTextStyle.copyWith(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
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
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: emailController,
                      autofocus: true,
                      textAlign: TextAlign.center,
                      style: kTextStyle.copyWith(fontSize: 24),
                      decoration: InputDecoration(
                        fillColor: kLightTextColor,
                        hintText: 'e.g: john@gmail.com',
                        hintStyle: kTextStyle.copyWith(fontSize: 24),
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Sshhhh.. what\'s the password?',
                    style: kTextStyle.copyWith(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
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
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: passwordController,
                      autofocus: true,
                      textAlign: TextAlign.center,
                      style: kTextStyle.copyWith(fontSize: 24),
                      decoration: InputDecoration(
                        fillColor: kLightTextColor,
                        hintText: 'Password',
                        hintStyle: kTextStyle.copyWith(fontSize: 24),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
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
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                      ),
                      obscureText: passwordObscure,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          apis.userAuth(
                            name: widget.name,
                            interest: widget.interest,
                            major: widget.major,
                            uid: widget.uid,
                            location: widget.location,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                            (route) => false,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: kBlueColor,
                      ),
                      child: Text(
                        'Create an account',
                        style: kTextStyle.copyWith(
                            fontSize: 18, color: kWhiteColor),
                      ),
                    ),
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
