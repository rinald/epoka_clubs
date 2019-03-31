import 'package:flutter/material.dart';

class Clubs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Clubs'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.error, 
                size: 100,
                color: Colors.grey,
              ),
              Text('Nothing to see'),
            ],
          ),
        ),
      ),
    );
  }
}