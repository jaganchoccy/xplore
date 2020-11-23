import 'package:flutter/material.dart';

class PostCreateScreen extends StatefulWidget {
  PostCreateScreen({Key key}) : super(key: key);

  @override
  _PostCreateScreenState createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends State<PostCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Text('post create'),
        ),
      ),
    );
  }
}
