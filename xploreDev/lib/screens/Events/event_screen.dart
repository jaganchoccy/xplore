import 'package:flutter/material.dart';
import '../../size_config.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event"),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
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
              height: 40,
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
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
                    left: 3.0,
                    top: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/jaganRamanikanth.png'),
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
      ),
    );
  }
}
