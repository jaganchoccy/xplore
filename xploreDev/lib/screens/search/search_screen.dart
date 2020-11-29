import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextEditingController = TextEditingController();
  Future<QuerySnapshot> futureSearchResults;

  emptyTextForm() {
    searchTextEditingController.clear();
  }

  AppBar _searchAppBar() {
    return AppBar(
      backgroundColor: Colors.red,
      title: TextFormField(
        style: TextStyle(
          fontSize: 12,
        ),
        controller: searchTextEditingController,
        decoration: InputDecoration(
          hintText: "search here",
          hintStyle: TextStyle(color: Colors.green),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          filled: true,
          prefixIcon: Icon(Icons.person_pin, color: Colors.white, size: 30.0),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            color: Colors.white,
            onPressed: emptyTextForm,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _searchAppBar(),
        body: Container(
          child: Text('jaganssearch'),
        ),
      ),
    );
  }
}
