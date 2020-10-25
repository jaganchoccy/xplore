import 'package:flutter/material.dart';
import '../../../components/default_button.dart';
import '../../../screens/sign_in/sign_in_screen.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.2),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.3, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.1),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Account created Successfully",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to Login",
            press: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
