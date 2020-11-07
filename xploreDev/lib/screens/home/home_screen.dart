import 'package:flutter/material.dart';
import 'package:xploreunitrix/constants.dart';
import 'package:xploreunitrix/screens/Profile_screen/profile_screen.dart';
import 'package:xploreunitrix/screens/Events/event_screen.dart';
import 'package:xploreunitrix/screens/Trip/trip_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItem = 0;
  var _pages = [
    EventScreen(),
    TripScreen(),
    EventScreen(),
    TripScreen(),
    ProfileScreen(),
    EventScreen(),
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
              title: Text('Feed', style: TextStyle(fontFamily: 'Muli')),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.developer_board),
              title: Text('Trip', style: TextStyle(fontFamily: 'Muli')),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monochrome_photos),
              title: Text('Post', style: TextStyle(fontFamily: 'Muli')),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Activity', style: TextStyle(fontFamily: 'Muli')),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.panorama_fish_eye),
              title: Text('Profile', style: TextStyle(fontFamily: 'Muli')),
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
