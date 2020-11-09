import 'package:flutter/material.dart';
import 'package:xploreunitrix/constants.dart';
import 'package:xploreunitrix/screens/tripPost/tripPost_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TripScreen extends StatelessWidget {
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TripPostScreen(),
                    ));
              }),
          centerTitle: true,
          title: Text(
            "Explore",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Three',
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
            IconButton(
                color: kPrimaryColor,
                icon: Icon(Icons.auto_awesome_mosaic),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TripPostScreen(),
                      ));
                }),
          ],
        ),
        body: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.green,
              child: new Center(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('$index'),
                ),
              )),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}
