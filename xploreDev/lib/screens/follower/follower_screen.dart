import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:xploreDev/constants.dart';
import 'package:xploreDev/screens/following/following_screen.dart';

class FollowersPage extends StatelessWidget {
  final int data;
  const FollowersPage({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 6.0,
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: DefaultTabController(
          length: 2,
          initialIndex: this.data,
          child: NestedScrollView(
              body: TabBarView(children: [FollowingData(), FollowingPage()]),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverPadding(
                    padding: new EdgeInsets.all(0),
                    sliver: new SliverList(
                      delegate: new SliverChildListDelegate([
                        TabBar(
                            indicatorColor: kPrimaryColor,
                            labelColor: kPrimaryColor,
                            labelPadding: EdgeInsets.only(top: 8, bottom: 2),
                            unselectedLabelColor: Colors.grey[700],
                            tabs: [
                              Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '567 ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13),
                                    ),
                                    Text(
                                      'followers',
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '263 ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13),
                                    ),
                                    Text(
                                      'following',
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ]),
                    ),
                  ),
                ];
              }),
        ),
      ),
    );
  }
}

class FollowingData extends StatefulWidget {
  FollowingData({Key key}) : super(key: key);

  @override
  _FollowingDataState createState() => _FollowingDataState();
}

class _FollowingDataState extends State<FollowingData> {
  Future<List<User>> _getUsers() async {
    var data = await http.get("https://jsonplaceholder.typicode.com/users");
    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["id"], u["email"], u["username"], u["name"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://picsum.photos/250?image=9'),
                  ),
                  title: Text(snapshot.data[index].name),
                  subtitle: Text(
                    snapshot.data[index].sub,
                    style: TextStyle(),
                  ),
                  trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                      padding: EdgeInsets.all(0),
                      highlightColor: Colors.grey[700],
                      color: Colors.white,
                      onPressed: () {},
                      child: Text(
                        'followers',
                        style: TextStyle(),
                      ),
                      textColor: kPrimaryColor),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class User {
  final int index;
  final String pic;
  final String sub;
  final String name;
  User(this.index, this.pic, this.name, this.sub);
}
