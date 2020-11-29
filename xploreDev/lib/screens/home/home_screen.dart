import 'package:flutter/material.dart';
import 'package:xploreDev/constants.dart';
import 'package:xploreDev/screens/Post/post_screen.dart';
import 'package:xploreDev/screens/Profile_screen/profile_screen.dart';
import 'package:xploreDev/screens/Trips/trip_screen.dart';
import 'package:xploreDev/screens/Feeds/feed_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          final isFirstRouteInCurrentTab =
              !await _navigatorKeys[_selectedIndex].currentState.maybePop();
          print(isFirstRouteInCurrentTab.toString());
          // let system handle back button if we're on the first route
          return isFirstRouteInCurrentTab;
        } else {
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
            _buildOffstageNavigator(4),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
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
              activeIcon: Icon(
                Icons.ac_unit_sharp,
                color: kPrimaryLightColor,
              ),
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
            print(_selectedIndex);
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          FeedScreen(),
          TripScreen(),
          PostScreen(),
          TripScreen(),
          ProfilePage(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}
