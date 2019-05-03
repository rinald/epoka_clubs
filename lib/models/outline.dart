import 'package:flutter/material.dart';

class Outline extends StatelessWidget{

  Outline.create(text){
    this.text=text;
  }
  String text;
  @override
  Widget build(BuildContext cont){
    return Container(
      margin: const EdgeInsets.all(5.0),
      alignment: FractionalOffset(-0.4, 0.5),
      child: new CircleAvatar(
        backgroundColor: Colors.lightGreen,
        child: Text(text),

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

    );
  }

}