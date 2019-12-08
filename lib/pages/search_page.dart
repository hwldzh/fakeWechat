import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {

  @override
  SearchPageState createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索页"),
      ),
      body: Text("搜索页"),
    );
  }

}