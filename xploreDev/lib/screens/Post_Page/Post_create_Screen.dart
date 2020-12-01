import 'package:flutter/material.dart';
import 'package:xploreDev/components/Upload_gallery.dart';

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
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: UploadGallery(),
              ),
              Text('dasd'),
            ],
          ),
        ),
      ),
    );
  }
}
