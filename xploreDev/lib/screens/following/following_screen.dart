import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class FollowingPage extends StatefulWidget {
  FollowingPage({Key key}) : super(key: key);

  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  List<User> users = new List();

  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    _getUsers();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print(_scrollController.position.pixels);
        loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
              controller: _scrollController,
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
                        'following',
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

  Future<List<User>> _getUsers() async {
    var data = await http.get("https://jsonplaceholder.typicode.com/users");
    if (data.statusCode == 200) {
      var jsonData = json.decode(data.body);

      for (var u in jsonData) {
        User user = User(u["id"], u["email"], u["username"], u["name"]);
        users.add(user);
      }
      print('${users.length} + length');
      return users;
    } else {
      throw Exception('failed load data');
    }
  }

  loadMore() {
    print('loaddata');
    _getUsers();
  }
}

class User {
  final int index;
  final String pic;
  final String sub;
  final String name;
  User(this.index, this.pic, this.name, this.sub);
}
