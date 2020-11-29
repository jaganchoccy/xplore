import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:xploreDev/screens/follower/follower_screen.dart';
import './dummy.dart';

Widget _buildUserProfileImg() {
  return Container(
    child: Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/jaganRamanikanth.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(80.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 0.50))
              ],
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              )),
        ),
        Container(
          child: Positioned(
            right: -5,
            top: 60,
            child: Column(
              children: [
                Container(
                  width: 20,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(80.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 0.50))
                    ],
                    border: Border.all(
                      width: 1.0,
                      color: Colors.black45,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 12,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget _buildProfileEdit() {
  return Container(
    width: 30,
    height: 30.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(80.0),
      boxShadow: [
        BoxShadow(
            color: Colors.black26, blurRadius: 10.0, offset: Offset(0.0, 0.50))
      ],
    ),
    child: Icon(
      Icons.mode_edit,
      color: Colors.black,
      size: 15,
    ),
  );
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: SafeArea(
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.green, Colors.teal[700]],
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 0.50))
                        ]),
                    child: Container(
                      width: double.infinity,
                      height: 200.0,
                    ),
                  ),
                  Container(
                    child: Positioned(
                      bottom: -30,
                      left: 10,
                      child: Column(
                        children: <Widget>[
                          _buildUserProfileImg(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Positioned(
                      right: 10,
                      bottom: -13,
                      child: Column(
                        children: <Widget>[
                          _buildProfileEdit(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          padding: const EdgeInsets.only(top: 10, bottom: 3),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Jagan Unitrix',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, bottom: 8),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.place,
                            size: 14,
                          ),
                          Text(
                            'Coimbatore, India',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[600],
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('follower');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FollowersPage(data: 0)));
                          },
                          child: Column(
                            children: [
                              Text(
                                '567',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  letterSpacing: 0,
                                ),
                              ),
                              Text(
                                'followers',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[600],
                                  letterSpacing: 0.5,
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('following');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FollowersPage(data: 1)));
                          },
                          child: Column(
                            children: [
                              Text(
                                '263',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  letterSpacing: 0,
                                ),
                              ),
                              Text(
                                'following',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[600],
                                  letterSpacing: 0.5,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 1.5,
                width: 70,
                color: Colors.grey[350],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Treat others as you want to be treated. :)                          #Explore #duke250",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[600],
                  letterSpacing: .2,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 1.5,
              width: double.infinity,
              color: Colors.grey[350],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
