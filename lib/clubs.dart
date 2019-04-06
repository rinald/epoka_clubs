import 'package:flutter/material.dart';

final leftSection =  Container(
  child:  CircleAvatar(
    backgroundColor: Colors.lightGreen,
    child: Text('HI'),

    radius: 30.0,
  ),
);

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() =>  _HomePageState();
}

class Clubs extends StatelessWidget {
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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar:  AppBar(
        title:  Text('Clubs Informations '),
      ),
      body:
        Container(
        color: const Color(0xFFcca6b2),
        padding: const EdgeInsets.all(0.0),
        alignment: FractionalOffset(0.428, 0.111),

      child: Container(
        alignment: Alignment.topCenter,
      child:// <Widget>[
        //leftSection,
        Container(
          alignment: FractionalOffset(-0.4, 0.5),
          child:  CircleAvatar(
            backgroundColor: Colors.lightGreen,
            child: Text('HI'),

            radius: 70.0,
          ),
          padding: const EdgeInsets.fromLTRB(25.0, 22.0, 25.0, 20.0),
          // alignment: Alignment.topCenter,
          width: 360.0,
          height: 150.0,
          decoration: BoxDecoration(
            //width: 360.0,
            color: const Color(0xFF531737),
            borderRadius:  BorderRadius.circular(25.0),
            border: Border.all(
              color: Colors.black,
              width: 1.5,
            ),
          ),
        ),
       ),
      ),
    );
  }
}
