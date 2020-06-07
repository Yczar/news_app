import 'package:flutter/material.dart';

class SearchVieww extends StatefulWidget {
  @override
  _SearchViewwState createState() => _SearchViewwState();
}

class _SearchViewwState extends State<SearchVieww> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value){
    if(value.length == 0){
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TextField(
            onChanged: initiateSearch(),
            decoration: InputDecoration(
              prefixIcon: IconButton(
                color: Colors.black,
                icon: Icon(Icons.arrow_back),
                iconSize: 20,
              )
            ),
          )
        ],
      ),
    );
  }
}
