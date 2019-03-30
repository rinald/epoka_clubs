import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(0.0),
        alignment: FractionalOffset(0.428, 0.111),

      child: Container(
        alignment: Alignment.topCenter,
      child:// <Widget>[
        //leftSection,
        Container(
          alignment: FractionalOffset(-0.4, 0.5),
          child: new CircleAvatar(
            backgroundColor: Colors.lightGreen,
            child: Text('HI'),

            radius: 70.0,
          ),
          padding: const EdgeInsets.fromLTRB(25.0, 22.0, 25.0, 20.0),
           //alignment: Alignment.topCenter,
          width: 360.0,
          height: 150.0,
          decoration: BoxDecoration(
            //width: 360.0,
            color: const Color(0xFF531737),
            borderRadius: new BorderRadius.circular(25.0),
            border: Border.all(
              color: Colors.black,
              width: 1.5,
            ),
          ),

      ),


   //],

       ),
       ),
    );
  }
}
