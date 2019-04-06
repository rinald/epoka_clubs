import 'package:epokaclubs/models/Event.dart';
import 'package:epokaclubs/subscriptionSample.dart';
import 'package:flutter/material.dart';


class EventWidget extends StatelessWidget {
  @override
  Widget build(BuildContext covariant) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new ListEvents(),
    );
  }
}

class ListEvents extends StatelessWidget {
  @override


  static Event newEvent = new Event("Programing Club","213214","Kristjan",3);

  List<Event>  _event  = [newEvent];

  Widget build (BuildContext covariant) {

    return new Scaffold(

        appBar: new AppBar(title: new Text("Events Page"),),
        body: ListView.builder(
          itemCount: _event.length,
          itemBuilder:(context, index){
            return ListTile(
              title: Text('${_event[index].Title}'),
              leading: Text('${_event[index].club.admin}'),
            );
          },

        )
    );
  }
}

