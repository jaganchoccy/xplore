import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xploreunitrix/constants.dart';
import 'package:xploreunitrix/screens/Feeds/feed_screen.dart';
import 'package:xploreunitrix/screens/Post_Page/Post_create_Screen.dart';

import '../../size_config.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        SvgPicture.asset(
                          'assets/images/nature.svg',
                          height: 100, //40%
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Create Trip',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ]),
                      Container(
                        color: Colors.black38,
                        height: 70,
                        width: 1,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostCreateScreen(),
                            ),
                          );
                        },
                        child: Column(children: [
                          SvgPicture.asset(
                            'assets/images/undraw_moments.svg',
                            height: 100, //40%
                            width: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Photos/Video',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: Container(
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedScreen(),
                    ),
                  );
                },
                backgroundColor: kPrimaryColor,
                child: Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
