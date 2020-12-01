import 'package:flutter/material.dart';

class PostTripScreen extends StatefulWidget {
  PostTripScreen({Key key}) : super(key: key);

  @override
  _PostTripScreenState createState() => _PostTripScreenState();
}

class _PostTripScreenState extends State<PostTripScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Text('post trip create'),
        ),
      ),
    );
  }
}
