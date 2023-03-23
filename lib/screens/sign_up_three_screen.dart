import 'package:binary_brains/components/curve_clipper.dart';
import 'package:binary_brains/screens/sign_up_four_screen.dart';
import 'package:flutter/material.dart';
import 'package:binary_brains/constants/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpThreeScreen extends StatefulWidget {
  final String name;
  final String interest;
  const SignUpThreeScreen({
    super.key,
    required this.name,
    required this.interest,
  });

  @override
  State<SignUpThreeScreen> createState() => _SignUpThreeScreenState();
}

class _SignUpThreeScreenState extends State<SignUpThreeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController majorController = TextEditingController();
  TextEditingController uidController = TextEditingController();
  @override
  void dispose() {
    majorController.dispose();
    uidController.dispose();
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
                    'Just 2 steps away!',
                    style: kTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'What\'s your major?',
                  style: kTextStyle.copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
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
                      controller: majorController,
                      autofocus: true,
                      textAlign: TextAlign.center,
                      style: kTextStyle.copyWith(fontSize: 24),
                      decoration: InputDecoration(
                        fillColor: kLightTextColor,
                        hintText: 'e.g: Computer Science',
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
                Text(
                  '..and University ID?',
                  style: kTextStyle.copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
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
                      controller: uidController,
                      autofocus: true,
                      textAlign: TextAlign.center,
                      style: kTextStyle.copyWith(fontSize: 24),
                      decoration: InputDecoration(
                        fillColor: kLightTextColor,
                        hintText: 'e.g: 11302',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            backgroundColor: kBlueColor,
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignUpFourScreen(
                                    name: widget.name,
                                    interest: widget.interest,
                                    major: majorController.text,
                                    uid: uidController.text,
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            backgroundColor: kBlueColor,
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.arrowRight,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
