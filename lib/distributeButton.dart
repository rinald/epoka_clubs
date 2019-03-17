import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  Button({
    this.text, this.route
  });
  final String text;
  final String route;
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      color: Colors.yellowAccent,
      child: new Text(text,style: new TextStyle(fontSize: 20.0,color: Colors.black),),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}