import 'package:flutter/material.dart';

class RouteTile extends StatelessWidget{
  RouteTile({this.text, this.route});
  final String text;
  final String route;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        Navigator.pushNamed(context, route);
      },
      child: ListTile (
        title: Text(
          text,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}