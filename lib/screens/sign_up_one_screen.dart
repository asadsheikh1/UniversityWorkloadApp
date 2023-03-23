import 'package:binary_brains/components/curve_clipper.dart';
import 'package:binary_brains/screens/sign_up_two_screen.dart';
import 'package:flutter/material.dart';
import 'package:binary_brains/constants/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpOneScreen extends StatefulWidget {
  const SignUpOneScreen({super.key});

  @override
  State<SignUpOneScreen> createState() => _SignUpOneScreenState();
}

class _SignUpOneScreenState extends State<SignUpOneScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
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
                  'We\'ve got you covered. You\'re just couple of steps away from joining us!',
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
                'Tell us your name!',
                style: kTextStyle.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
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
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: nameController,
                      autofocus: true,
                      textAlign: TextAlign.center,
                      style: kTextStyle.copyWith(fontSize: 24),
                      decoration: InputDecoration(
                        fillColor: kLightTextColor,
                        hintText: 'e.g: John Smith',
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpTwoScreen(
                                    name: nameController.text)));
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
    );
  }
}
