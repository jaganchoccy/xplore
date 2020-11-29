import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xploreDev/models/user.dart';
import 'package:xploreDev/screens/sign_in/components/body.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin<SearchScreen> {
  TextEditingController searchTextEditingController = TextEditingController();
  Future<QuerySnapshot> futureSearchResults;

  emptyTextForm() {
    searchTextEditingController.clear();
  }

  controlSearching(String value) {
    print(value);
    Future<QuerySnapshot> allUsers =
        usersReference.where("username", isGreaterThanOrEqualTo: value).get();
    setState(() {
      futureSearchResults = allUsers;
      print(allUsers);
    });
  }

  AppBar _searchAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 6.0,
      leading: Icon(Icons.arrow_back, color: Colors.black),
      backgroundColor: Colors.white,
      title: TextFormField(
        style: TextStyle(
          fontSize: 16,
        ),
        controller: searchTextEditingController,
        decoration: InputDecoration(
          hintText: "Search here...",
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          filled: true,
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            color: Colors.grey,
            onPressed: emptyTextForm,
          ),
        ),
        onFieldSubmitted: controlSearching,
      ),
    );
  }

  displayNoUser() {
    return Container(
      child: Text('no search found'),
    );
  }

  displayFoundUser() {
    return FutureBuilder(
        future: futureSearchResults,
        builder: (context, AsyncSnapshot<QuerySnapshot> dataSnapshot) {
          if (!dataSnapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                value: 3.0,
              ),
            );
          }
          print('asd');

          List<UserResult> searchUserResult = [];
          dataSnapshot.data.docs.forEach((document) {
            User eachUser = User.fromDocument(document);
            print(eachUser);
            UserResult userResult = UserResult(eachUser);
            searchUserResult.add(userResult);
          });
          return ListView(children: searchUserResult);
        });
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _searchAppBar(),
        body:
            futureSearchResults == null ? displayNoUser() : displayFoundUser(),
      ),
    );
  }
}

class UserResult extends StatelessWidget {
  final User eachUser;
  UserResult(this.eachUser);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => print("tapped"),
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: CachedNetworkImageProvider(eachUser.url)),
                title: Text(
                  eachUser.username,
                  style: TextStyle(fontSize: 12.0),
                ),
                subtitle: Text(eachUser.email),
              ),
            )
          ],
        ),
      ),
    );
  }
}
