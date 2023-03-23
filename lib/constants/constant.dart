import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const MaterialColor kPrimaryColor = MaterialColor(
  _kPrimaryValue,
  <int, Color>{
    50: Color(0xff242830),
    100: Color(0xff242830),
    200: Color(0xff242830),
    300: Color(0xff242830),
    400: Color(0xff242830),
    500: Color(_kPrimaryValue),
    600: Color(0xff242830),
    700: Color(0xff242830),
    800: Color(0xff242830),
    900: Color(0xff242830),
  },
);

const int _kPrimaryValue = 0xff242830;

Color kWhiteColor = Colors.white;
Color kBlackColor = Colors.black;
Color kOrangeColor = const Color(0xffff914d);
Color kBlueColor = Colors.blue;
Color kRedColor = Colors.red;
Color kTransparentColor = Colors.transparent;
Color kTextColor = const Color(0xff6a6c74);
Color kLightTextColor = const Color(0xffF0F0F0);
Color kGreyColor = Colors.grey.shade50;
int kDefaultPadding = 16;

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: kBlackColor),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

final kTextStyle = GoogleFonts.varelaRound(
  fontWeight: FontWeight.bold,
);
