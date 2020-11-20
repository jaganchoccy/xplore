import 'package:flutter/material.dart';
import 'package:xploreunitrix/constants.dart';
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
    TripScreen(),
    TripScreen(),
    ProfileScreen(),
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
              // ignore: deprecated_member_use
              title: Text(
                'Feed',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.developer_board),
              // ignore: deprecated_member_use
              title: Text(
                'Trip',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monochrome_photos),
              // ignore: deprecated_member_use
              title: Text(
                'Post',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_rounded),
              // ignore: deprecated_member_use
              title: Text(
                'Credits',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.panorama_fish_eye),
              // ignore: deprecated_member_use
              title: Text(
                'Profile',
              ),
            )
          ],
          onTap: (int index) {
            print(_selectedItem);
            setState(() {
              _selectedItem = index;
            });
          },
        ),
      ),
    );
  }
}
