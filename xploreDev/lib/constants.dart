import 'package:flutter/material.dart';
import './size_config.dart';

const kPrimaryColor = Color.fromARGB(0xFF, 0, 112, 74);
const kPrimaryLightColor = Color.fromARGB(0xFF, 0, 112, 74);
const KBackGroundColor = Color.fromARGB(0xFF, 247, 247, 247);
const kGrey = Color(0xFF757575);
const KRed = Color.fromARGB(0xFF, 222, 38, 32);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter the user name ";
const String kDOBNullError = "Please Enter your DOB ";

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
    borderSide: BorderSide(color: kTextColor),
  );
}
