import 'package:flutter/material.dart';
import 'package:xploreunitrix/constants.dart';
import 'package:xploreunitrix/screens/TripDetails/tripDetails_screen.dart';
import 'package:xploreunitrix/screens/tripPost/tripPost_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class TripScreen extends StatefulWidget {
  TripScreen({Key key}) : super(key: key);

  @override
  _TripScreenState createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  bool changeView = false;
  bool viewIcn = false;
  final List<String> imageList = [
    'https://ootytourism.co.in/images/headers/ooty-tea-estate-view-point-tourism-entry-fee-timings-holidays-reviews-header.jpg',
    'https://travelandynews.com/wp-content/uploads/2019/07/train-ooty.jpg',
    'https://img.traveltriangle.com/attachments/destinations/235/original/ooty.jpg',
    'https://ootytourism.co.in/images/headers/ooty-tea-estate-view-point-tourism-entry-fee-timings-holidays-reviews-header.jpg',
    'https://travelandynews.com/wp-content/uploads/2019/07/train-ooty.jpg',
    'https://img.traveltriangle.com/attachments/destinations/235/original/ooty.jpg',
    'https://ootytourism.co.in/images/headers/ooty-tea-estate-view-point-tourism-entry-fee-timings-holidays-reviews-header.jpg',
    'https://travelandynews.com/wp-content/uploads/2019/07/train-ooty.jpg',
    'https://img.traveltriangle.com/attachments/destinations/235/original/ooty.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 6,
          leading: IconButton(
              color: kPrimaryColor,
              icon: Icon(Icons.filter_alt_outlined),
              onPressed: () {}),
          centerTitle: true,
          title: Text(
            "Trip",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                color: kPrimaryColor,
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TripPostScreen(),
                      ));
                }),
            viewIcn == true
                ? IconButton(
                    color: kPrimaryColor,
                    icon: Icon(Icons.auto_awesome_mosaic),
                    onPressed: () {
                      print(changeView);
                      setState(() {
                        changeView = !changeView;
                        viewIcn = !viewIcn;
                      });
                    })
                : IconButton(
                    color: kPrimaryColor,
                    icon: Icon(Icons.storage_outlined),
                    onPressed: () {
                      print(changeView);
                      setState(() {
                        changeView = !changeView;
                        viewIcn = !viewIcn;
                      });
                    })
          ],
        ),
        body: changeView == false
            ? Container(
                margin: EdgeInsets.only(left: 6, right: 6, top: 10),
                child: new StaggeredGridView.countBuilder(
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    crossAxisCount: 2,
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print(index);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TripDetailsScreen(details: imageList[index]),
                            ),
                          );
                        },
                        child: Stack(children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 3, right: 3, bottom: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        child: FadeInImage.memoryNetwork(
                                          placeholder: kTransparentImage,
                                          image: imageList[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.only(
                                        top: 10, right: 8, left: 8, bottom: 5),
                                    child: Text(
                                      'trip coimbatore to ooty, morning tea ride..#duke250',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        letterSpacing: 0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 4,
                                    ),
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 2.0,
                                          top: 0.0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/jaganRamanikanth.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(80.0),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.5,
                                              ),
                                              color: const Color(0xffffffff),
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                      const Color(0x29000000),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                            ),
                                            width: 35.0,
                                            height: 35.0,
                                          ),
                                        ),
                                        Positioned(
                                          left: 40.0,
                                          top: 3.0,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Jagan Unitrix R',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2),
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.place,
                                                      size: 11,
                                                      color: Colors.grey[600],
                                                    ),
                                                    Text(
                                                      'Coimbatore',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey[600],
                                                        letterSpacing: 0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 5.0,
                                          bottom: 5.0,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.favorite,
                                                  size: 16,
                                                  color: KRed,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  '215',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 7.0,
                            top: 5.0,
                            child: Container(
                              height: 16.0,
                              width: 16.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10.0,
                            top: 8.0,
                            child: Container(
                              height: 10.0,
                              width: 10.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: index % 2 == 0
                                    ? Colors.grey[600]
                                    : kPrimaryColor,
                              ),
                            ),
                          )
                        ]),
                      );
                    },
                    staggeredTileBuilder: (index) {
                      return new StaggeredTile.count(
                          1, index.isEven ? 1.5 : 1.7);
                    }),
              )
            : Container(
                margin: EdgeInsets.only(top: 5),
                child: new ListView.builder(
                    itemCount: imageList.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return InkWell(
                        onTap: () {
                          print(index);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TripDetailsScreen(details: imageList[index]),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              margin: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 10, right: 10),
                              height: 250,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                            bottomLeft: Radius.zero,
                                            bottomRight: Radius.zero),
                                        child: FadeInImage.memoryNetwork(
                                          placeholder: kTransparentImage,
                                          image: imageList[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    padding: EdgeInsets.only(
                                        top: 10, right: 8, left: 8, bottom: 5),
                                    child: Text(
                                      'trip coimbatore to ooty, morning tea ride..#duke250',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        letterSpacing: 0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 48,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 6.0,
                                          top: 0.0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/jaganRamanikanth.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(80.0),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.5,
                                              ),
                                              color: const Color(0xffffffff),
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                      const Color(0x29000000),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                            ),
                                            width: 40.0,
                                            height: 40.0,
                                          ),
                                        ),
                                        Positioned(
                                          left: 50.0,
                                          top: 3.0,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Jagan Unitrix R',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2),
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.place,
                                                      size: 13,
                                                      color: Colors.grey[600],
                                                    ),
                                                    Text(
                                                      'Coimbatore',
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey[600],
                                                        letterSpacing: 0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 10.0,
                                          bottom: 15.0,
                                          child: Container(
                                              child: Row(
                                            children: [
                                              Icon(
                                                Icons.favorite,
                                                size: 18,
                                                color: KRed,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                '21K',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Icon(
                                                Icons.speaker_notes,
                                                size: 18,
                                                color: Colors.grey[600],
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                '156',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 15.0,
                              top: 10.0,
                              child: Container(
                                height: 16.0,
                                width: 16.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 18.0,
                              top: 13.0,
                              child: Container(
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: index % 2 == 0
                                      ? Colors.grey[600]
                                      : kPrimaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}
