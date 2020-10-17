import 'package:flutter/material.dart';
import 'package:xploreDev/constants.dart';
import 'widgets/logIn.dart';

void main() => runApp(Xplore());

class Xplore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xplore',
      theme: ThemeData(
          primaryColor: PrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: LoginPage(),
    );
  }
}
