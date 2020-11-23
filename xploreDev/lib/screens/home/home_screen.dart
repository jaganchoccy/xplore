import 'package:flutter/material.dart';
import 'package:xploreunitrix/constants.dart';
import 'package:xploreunitrix/screens/Post/post_screen.dart';
import 'package:xploreunitrix/screens/Profile_screen/profile_screen.dart';
import 'package:xploreunitrix/screens/Trips/trip_screen.dart';
import 'package:xploreunitrix/screens/Feeds/feed_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItem = 0;
  var _pages = [
    FeedScreen(),
    TripScreen(),
    PostScreen(),
    TripScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.grey[100]),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: _pages[_selectedItem],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedItem,
          selectedFontSize: 12.0,
          elevation: 5.0,
          unselectedItemColor: Colors.grey[600],
          selectedItemColor: Colors.grey[600],
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(color: kPrimaryColor),
          unselectedIconTheme: IconThemeData(color: Colors.grey[600]),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.developer_board),
              label: 'Trip',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monochrome_photos),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_rounded),
              label: 'Credits',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.panorama_fish_eye),
              label: 'Profile',
            ),
          ],
          onTap: (int index) {
            setState(() {
              _selectedItem = index;
              print(_selectedItem);
            });
          },
        ),
      ),
    );
  }
}
