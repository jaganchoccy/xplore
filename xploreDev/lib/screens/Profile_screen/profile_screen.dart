import 'package:flutter/material.dart';
import 'package:xploreunitrix/constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Hi Jagan Unitrix",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        drawer: Drawer(
          child: Text('gjg'),
          elevation: 3,
        ),
        body: Text('adas'),
      ),
    );
  }
}
