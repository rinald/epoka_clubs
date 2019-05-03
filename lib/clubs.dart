import 'package:flutter/material.dart';
import 'package:epokaclubs/models/outline.dart';
final leftSection = new Container(
  child: new CircleAvatar(
    backgroundColor: Colors.lightGreen,
    child: Text('HI'),

    radius: 30.0,
  ),
);
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class Clubs extends StatelessWidget {
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(child:  Text('Clubs information'))
    );
  }
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text('Clubs Informations '),
      ),
      body:
       new Container(
        color: const Color(0xFFcca6b2),
        padding: const EdgeInsets.fromLTRB( 20.0, 10.0, 10.0, 10.0),
        alignment: FractionalOffset(0.428, 0.111),

         child: Container(
           alignment: Alignment.topCenter,
           child:// <Widget>[
           //leftSection,
           ListView(
             children:<Widget>[
                Outline.create('HI')
               ,Outline.create('HII')
             ]
           )


           //],

         ),
       ),
    );
  }
}
