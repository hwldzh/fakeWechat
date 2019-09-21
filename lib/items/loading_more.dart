import 'package:flutter/material.dart';

class LoadingMore extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      alignment: Alignment.center,
      child: Text(
        "加载更多...",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14
        ),
      ),
    );
  }

}