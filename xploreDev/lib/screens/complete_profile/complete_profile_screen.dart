import 'package:flutter/material.dart';
import 'package:xploreDev/screens/sign_up/components/sign_up_form.dart';

import 'components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";

  @override
  Widget build(BuildContext context) {
    //SignUpForm args = ModalRoute.of(context).settings.arguments;
    //print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}
