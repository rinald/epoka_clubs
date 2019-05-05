import 'package:flutter/material.dart';
import 'package:epokaclubs/details.dart';
import 'package:epokaclubs/data.dart';

class Outline extends StatelessWidget{

  Outline.create(text,this.name,this.descr,this.ids){
    this.text=text;
    //ToDo We should use this to update the UI of the club pages
    //this.icon=icon;
    //this.route=route;
  }
  String text, name, descr;
  int ids;
  //Icon icon;
  //Route route;

  @override
  Widget build(BuildContext cont){
    return InkWell(
          onTap: () {
            Navigator.push(
                cont,
                MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      inf: Data.infList[ids],
                    )));
          },
      child: Stack(
        children: <Widget>[
          Positioned(
           // left: 2,
          child: Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(0),
            //alignment: FractionalOffset(-0.4, 0.5),
           child:  Align(
             alignment: Alignment.centerRight,
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisSize: MainAxisSize.min,
                //move the circular photo to the left
                children: <Widget>[
                  new Container(
                    child: Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        //crossAxisAlignment:
                        //This has 2 texts=align them properly
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                             Text(name,
                                  style: TextStyle(
                                  color: Colors.white,
                                    fontSize: 20,
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
                                    color: Colors.white,
                                    fontSize: 12,),),
                            ],
                          ),
//                    Column(
//                      children: <Widget>[
//                      ],
//                    ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.favorite),
                              iconSize: 45,
                              onPressed: (){
                                doSomething();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
           ),
//            padding: const EdgeInsets.fromLTRB(25.0, 22.0, 25.0, 20.0),
            width: 365.0,
            height: 145.0,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: new BorderRadius.circular(25.0),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            ),
          ),
          Positioned(
          left: 10,
          bottom: 25,
          top: 25,
            child: ClipOval(
              child: Hero(
                tag: Data.infList[ids].id,
                child: FadeInImage(
                  image:
                  NetworkImage(Data.infList[ids].img),
                  fit: BoxFit.cover,
                  placeholder:
                  AssetImage('assets/images/loading.gif'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
void doSomething() {
  //Do something
  //ToDo Connect subscriptions with club
  print('You subscribed to this club!');
}