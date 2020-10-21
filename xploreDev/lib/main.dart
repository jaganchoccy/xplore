import 'package:flutter/material.dart';
import './routes.dart';
import './screens/splash/splash_screen.dart';
import './theme.dart';

void main() {
  runApp(Xplore());
}

class Xplore extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xplore',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
