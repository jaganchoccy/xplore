import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:xploreDev/constants.dart';

class WhatsNew extends StatelessWidget {
  const WhatsNew({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 10),
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return FittedBox(
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(right: 15),
                width: 400,
                height: 300,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: imageList[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, left: 2),
                          width: double.infinity,
                          child: Text(
                            '#ooty, Coimbatore',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Positioned(
                        right: 30,
                        bottom: 24,
                        child: FloatingActionButton(
                          heroTag: null,
                          onPressed: () {},
                          backgroundColor: KRed,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Icon(
                                Icons.favorite,
                                size: 20,
                                color: Colors.white,
                              ),
                              Text(
                                '21K',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
