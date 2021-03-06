import 'package:flutter/material.dart';
import 'package:xploreDev/constants.dart';
import 'package:xploreDev/screens/Feeds/whatsNews.dart';
import 'package:xploreDev/screens/search/search_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final WhatsNew _whatsNew = WhatsNew();
  ScrollController _scrollController = ScrollController();
  bool closeTopContainer = false;
  final List<String> imageList = [
    'https://img.traveltriangle.com/attachments/destinations/235/original/ooty.jpg',
    'https://travelandynews.com/wp-content/uploads/2019/07/train-ooty.jpg',
    'https://ootytourism.co.in/images/headers/ooty-tea-estate-view-point-tourism-entry-fee-timings-holidays-reviews-header.jpg',
    'https://ootytourism.co.in/images/headers/ooty-tea-estate-view-point-tourism-entry-fee-timings-holidays-reviews-header.jpg',
    'https://travelandynews.com/wp-content/uploads/2019/07/train-ooty.jpg',
    'https://img.traveltriangle.com/attachments/destinations/235/original/ooty.jpg',
    'https://ootytourism.co.in/images/headers/ooty-tea-estate-view-point-tourism-entry-fee-timings-holidays-reviews-header.jpg',
    'https://travelandynews.com/wp-content/uploads/2019/07/train-ooty.jpg',
    'https://img.traveltriangle.com/attachments/destinations/235/original/ooty.jpg',
  ];
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        closeTopContainer = _scrollController.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "What's New",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                color: kPrimaryColor,
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ));
                }),
            IconButton(
                color: kPrimaryColor,
                icon: Icon(Icons.more_horiz),
                onPressed: () {})
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    height: closeTopContainer ? 0 : 200,
                    alignment: Alignment.topCenter,
                    child: _whatsNew),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: imageList.length,
                    controller: _scrollController,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: 6, left: 0.0, right: 0.0),
                        height: 500,
                        child: Card(
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          color: Colors.white,
                          elevation: 0,
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                margin: EdgeInsets.only(top: 4),
                                padding: EdgeInsets.only(left: 4, right: 4),
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 6.0,
                                      top: 4.0,
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
                                        ),
                                        width: 45.0,
                                        height: 45.0,
                                      ),
                                    ),
                                    Positioned(
                                      left: 55.0,
                                      top: 6.0,
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
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.timelapse,
                                                  size: 13,
                                                  color: Colors.grey[600],
                                                ),
                                                Text(
                                                  ' 2 hours ago',
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
                                      right: 2.0,
                                      top: 1.0,
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        child: SizedBox(
                                          height: 28,
                                          child: OutlineButton(
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        15)),
                                            textColor: kPrimaryColor,
                                            child: Text(
                                              'Follow',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: kPrimaryColor,
                                                letterSpacing: 0,
                                              ),
                                            ),
                                            borderSide: BorderSide(
                                                color: kPrimaryColor,
                                                style: BorderStyle.solid,
                                                width: 1),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                color: Colors.white,
                                padding: EdgeInsets.only(
                                    top: 5, right: 12, left: 12, bottom: 5),
                                child: Text(
                                  '#Ooty.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kPrimaryColor,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                color: Colors.white,
                                padding: EdgeInsets.only(
                                    top: 0, right: 8, left: 12, bottom: 12),
                                child: Text(
                                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking typesetting industry.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.zero,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: ClipRRect(
                                    child: InteractiveViewer(
                                      maxScale: 5.0,
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: imageList[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12, right: 8),
                                child: Row(
                                  children: [
                                    IconButton(
                                        constraints: BoxConstraints(),
                                        padding: EdgeInsets.zero,
                                        color: KRed,
                                        icon: Icon(
                                          Icons.favorite,
                                          size: 18,
                                        ),
                                        onPressed: () {}),
                                    SizedBox(width: 3),
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
                                    IconButton(
                                        constraints: BoxConstraints(),
                                        padding: EdgeInsets.zero,
                                        color: Colors.grey[600],
                                        icon: Icon(
                                          Icons.speaker_notes,
                                          size: 18,
                                        ),
                                        onPressed: () {}),
                                    SizedBox(width: 5),
                                    RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '152',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500)),
                                          TextSpan(
                                            text: ' Comments',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                        color: kPrimaryColor,
                                        icon: Icon(Icons.bookmark_outlined),
                                        onPressed: () {}),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
