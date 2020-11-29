import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:xploreDev/constants.dart';
import 'package:xploreDev/screens/Trips/trip_screen.dart';
import '../../size_config.dart';
import 'package:transparent_image/transparent_image.dart';

class TripDetailsScreen extends StatelessWidget {
  final Object details;
  const TripDetailsScreen({Key key, @required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SilverAppBarWithTabBarScreen(
      details: details,
    ));
  }
}

class SilverAppBarWithTabBarScreen extends StatefulWidget {
  final Object details;
  const SilverAppBarWithTabBarScreen({Key key, @required this.details})
      : super(key: key);
  @override
  _SilverAppBarWithTabBarState createState() => _SilverAppBarWithTabBarState();
}

class _SilverAppBarWithTabBarState extends State<SilverAppBarWithTabBarScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            brightness: Brightness.dark,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
              IconButton(icon: Icon(Icons.share), onPressed: () {})
            ],
            leading: IconButton(
              color: Colors.white,
              icon: IconShadowWidget(
                Icon(Icons.arrow_back, color: Colors.white),
                shadowColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TripScreen(),
                  ),
                );
              },
            ),
            title: Text(
              'Trips',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                shadows: [
                  Shadow(
                      offset: Offset(5.0, 5.0),
                      blurRadius: 15.0,
                      color: Colors.black)
                ],
              ),
            ),
            pinned: true,
            flexibleSpace: Stack(
              children: [
                Positioned(
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.details,
                      ),
                    ),
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 190.0, right: 190.0, bottom: 0.0),
                      child: Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    height: 20,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, -15),
                          blurRadius: 10,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                  ),
                  bottom: -1,
                  left: 0,
                  right: 0,
                ),
              ],
            ),
            expandedHeight: 450.0,
          ),
          SliverList(
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return overView();
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}

Widget overView() {
  return Container(
    height: 500,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: const Color(0x29000000),
          offset: Offset(0, -8),
          blurRadius: 15,
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/jaganRamanikanth.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(80.0),
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              width: 50.0,
              height: 50.0,
            ),
            title: Text(
              'Jagan Unitrix',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            subtitle: Text(
              'Comibatore',
              style: TextStyle(fontSize: 14),
            ),
            trailing: Container(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Text(
                    '06-Dec-2020',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '5 Days',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey[700]),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 0, right: 15, left: 15, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.white,
                    width: 200,
                    child: Text(
                      'Culture common type of placeholder text',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: IconButton(
                                      constraints: BoxConstraints(),
                                      padding: EdgeInsets.zero,
                                      color: KRed,
                                      icon: Icon(
                                        Icons.favorite,
                                        size: 18,
                                      ),
                                      onPressed: () {})),
                              Container(
                                child: Text(
                                  '219K',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(right: 3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: IconButton(
                                      constraints: BoxConstraints(),
                                      padding: EdgeInsets.zero,
                                      color: Colors.grey[600],
                                      icon: Icon(
                                        Icons.speaker_notes,
                                        size: 18,
                                      ),
                                      onPressed: () {})),
                              Container(
                                  child: Text(
                                '21',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0,
                                  color: Colors.black,
                                ),
                              ))
                            ],
                          ))
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Text(
                  'Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply copy that serves to fill a space without actually saying anything meaningful. ... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
