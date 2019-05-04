import 'package:flutter/material.dart';

class Outline extends StatelessWidget{

  Outline.create(text,name,descr){
    this.text=text;//ToDo From text = > image(How?!)
    this.name=name;
    this.descr=descr;
    //ToDo We should use this to update the UI of the club pages
    //this.icon=icon;
    //this.route=route;
  }
  String text;
  String name;
  String descr;
  //Icon icon;
  //Route route;

  @override
  Widget build(BuildContext cont){
    return InkWell(

          onTap: () {
            print("Container clicked"); //ToDo Not working properly!
          },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        alignment: FractionalOffset(-0.4, 0.5),
        child: Row(
          //move the circular photo to the left
          children: <Widget>[
            new CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(text),

              radius: 70.0,
            ),
            new Container(
              child: Row(
                //This has 2 texts=align them properly
                children: <Widget>[
                  Column(
                    children: <Widget>[
                     Text(name,
                          style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      /*AutoSizeText(
                        "A really long String",
                        style: TextStyle(fontSize: 30.0),
                        minFontSize: 18.0,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      )*/
                      Text(descr,
                        style: TextStyle(
                            color: Colors.white),),

                    ],
                  ),
                  Column(
                    children: <Widget>[

                      Icon(Icons.favorite, color: Colors.red),//Favourite Icon used to subscribe this club

                    ],

                  )
                ],
              ),


            )
          ],
        ),
        padding: const EdgeInsets.fromLTRB(25.0, 22.0, 25.0, 20.0),
        //alignment: Alignment.topCenter,
        width: 360.0,
        height: 150.0,
        decoration: BoxDecoration(
          //width: 360.0,
          //color: const Color(0xFF531737),
          color: Colors.lightBlue,
          borderRadius: new BorderRadius.circular(25.0),
          border: Border.all(
            color: Colors.black,
            width: 1.5,
          ),
        ),

      ),

    );
  }

}