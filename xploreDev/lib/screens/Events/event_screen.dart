import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xploreDev/constants.dart';
import '../../size_config.dart';

class EventScreen extends StatefulWidget {
  EventScreen({Key key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List _trips = [];
  bool loadingTrip = false;
  int perPage = 10;
  DocumentSnapshot _lastDoc;
  ScrollController _scrollController;

  Future<List> _getTripDetails() async {
    setState(() {
      loadingTrip = true;
    });

    try {
      QuerySnapshot snapshot =
          await _firestore.collection("trip").limit(perPage).get();

      if (snapshot.docs.length < 1) {
        print('no data');
      }
      for (int i = 0; i < snapshot.docs.length; i++) {
        _trips.add(snapshot.docs[i].data());
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      loadingTrip = false;
    });
    print(_trips.length);
    return _trips; //_trips[index]["comments"]
  }

  _getMoreTrips() async {}

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _getTripDetails();
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.25;

      if (maxScroll - currentScroll < delta) {
        _getMoreTrips();
        print('more data');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;
    final orientation = MediaQuery.of(context).orientation;
    return loadingTrip == true
        ? Container(
            child: Center(
              child: Text('loading..'),
            ),
          )
        : Container(
            child: _trips.length == 0
                ? Center(
                    child: Text('no trips'),
                  )
                : GridView.builder(
                    controller: _scrollController,
                    itemCount: _trips.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (itemWidth / itemHeight),
                        crossAxisCount:
                            (orientation == Orientation.portrait) ? 2 : 3),
                    itemBuilder: (BuildContext context, int index) {
                      return tripCard();
                    }),
          );
  }
}

Widget tripCard() {
  return Container(
    color: KBackGroundColor,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              "assets/images/goa.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 0),
          child: Text(
            'NonStop TN47 three days Ride..#duke250',
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Two',
              fontWeight: FontWeight.normal,
              color: Colors.black,
              letterSpacing: 0,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 3.0,
                top: 0.0,
                child: Container(
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
                  ),
                  width: 35.0,
                  height: 35.0,
                ),
              ),
              Positioned(
                left: 40.0,
                top: 4.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jagan Unitrix',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.place,
                          size: 11,
                          color: Colors.grey[600],
                        ),
                        Text(
                          'Chennai',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[600],
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 3.0,
                bottom: 8.0,
                child: Container(
                  child: Text(
                    '12/02/20',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600],
                      letterSpacing: 0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
